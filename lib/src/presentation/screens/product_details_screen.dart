import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../data/models/models.dart';
import '../../utils/asset_manager.dart';
import '../widgets/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(theme.colorScheme.surfaceVariant),
          ),
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton.filled(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(theme.colorScheme.surfaceVariant),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(AssetManager.CART_ICON),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // thumbnail display
                  AspectRatio(
                    aspectRatio: 3 / 3,
                    child: CachedNetworkImage(
                      imageUrl: state.product.imageGallery?.first.url ?? AssetManager.THUMBNAIL_PLACEHOLDER,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // title & pricebar
                  ListTile(
                    title: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state)=> Text(state is CategoryFetchSucces ? state.category.title ?? '' : 'No Category')),
                    titleTextStyle: theme.textTheme.labelSmall
                        ?.copyWith(color: theme.colorScheme.outline),
                    subtitle: Text(state.product.productName ?? ''),
                    subtitleTextStyle: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Price',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: theme.colorScheme.outline),
                        ),
                        Text(
                          '\$${state.product.productPrice?.toStringAsFixed(2)}',
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  // image gallery
                  _buildProductImageGallery(layout.size.width * 0.2, state.product.imageGallery),

                  // varients gallery
                  _buildProductVariantGallery(state.product.varient),

                  // product description

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w600),
                        ),
                        ReadMoreText(
                          state.product.productDetails ?? 'No Details Available',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.outline),
                          textAlign: TextAlign.justify,
                          trimMode: TrimMode.Line,
                          trimLines: 5,
                          moreStyle: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.tertiary),
                          lessStyle: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.tertiary),
                          trimCollapsedText: 'Show More',
                          trimExpandedText: 'Show Less',
                        )
                      ],
                    ),
                  ),

                  // product reviews
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
                            style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View All',
                            style: theme.textTheme.labelSmall
                                ?.copyWith(color: theme.colorScheme.outline),
                          ),
                        ],
                      )),
                  const Column(
                    children: [
                      ProductReviewCard(
                        name: 'Jhon Abrham',
                        date: '13 Sep 2023',
                        ratingPoint: 2.8,
                        review:
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words',
                      )
                    ],
                  )
                ],
              );
            } else if (state is ProductFetchFailed) {
              return Column(
                children: [
                  LottieBuilder.asset(AssetManager.ERROR_ANIM),
                  const Gap(20),
                  Text(
                    state.message,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.colorScheme.error),
                  )
                ],
              );
            } else {
              return const Column();
            }
          },
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: theme.colorScheme.surfaceVariant,
            title: Text(
              'Total Price',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'with VAT,SD',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: BlocBuilder<ProductBloc, ProductState>(builder: (context, state){
              final double vat = state is ProductLoadSuccess ? state.product.vatSd ?? 0.0 : 0.0;
              debugPrint('Vat $vat');
              final double price = state is ProductLoadSuccess ? state.product.productPrice ?? 0.0 : 0.0;
              debugPrint('Vat $price');
              final double totalPrice = vat+price;
              debugPrint('Vat $totalPrice');
              return Text(
                '\$${totalPrice.toStringAsFixed(2)}',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w900,
              ),
              );
            }),
          ),
          FullWidthButton(
            buttonText: 'Add to Cart',
            textStyle: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductImageGallery(double height, List<ImageGallery>? imageGallery) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: imageGallery?.length ?? 0 + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Gap(10);
          }

          return AspectRatio(
            aspectRatio: 3 / 3,
            child: CachedNetworkImage(
              imageUrl: imageGallery?[index].url ?? AssetManager.THUMBNAIL_PLACEHOLDER,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Gap(10);
        },
      ),
    );
  }

  Widget _buildProductVariantGallery(List<Varient>? varient) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(varient?.length ?? 0, (index) => ProductVarientCategoryItem(title: varient?[index].category ?? '', items: varient?[index].items ?? [])),
    );
  }
}

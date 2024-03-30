import 'package:bloc_ecommerce/src/blocs/store/category_bloc.dart';
import 'package:bloc_ecommerce/src/data/preference/local_preference.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../blocs/blocs.dart';
import '../../routes/route_pages.dart';
import '../../utils/asset_manager.dart';
import '../../utils/values.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, isScrollable) => [
            SliverAppBar(
              floating: true,
              leading: IconButton.filled(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      theme.colorScheme.surfaceVariant),
                ),
                onPressed: () {},
                icon: SvgPicture.asset(AssetManager.MENU_ICON),
              ),
              actions: [
                IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        theme.colorScheme.surfaceVariant),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetManager.CART_ICON),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '${Values.GREETINGS} ${LocalPreferences.getString('username')}'),
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    subtitle: const Text(Values.WELCOME_SUB_TITLE),
                    subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                  const CustomSearchBar(),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Brand',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'View All',
                          style: theme.textTheme.labelSmall,
                        )
                      ],
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: layout.width * 0.13,
                    child: BlocBuilder<BrandBloc, BrandState>(
                      builder: (context, state) {
                        if (state is BrandFetchSuccess) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if(index == 0){
                                return const Gap(10);
                              }
                              return BrandCard(
                              brandLogo: state.brands[index-1].brandLogo,
                              brandTitle: state.brands[index-1].brandName,
                            );
                            },
                            separatorBuilder: (context, index) =>
                                const Gap(8.0),
                            itemCount: state.brands.length + 1,
                          );
                        } else {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ShimmerEffect.rectangular(
                                    width: 70, height: layout.width * 0.13),
                            separatorBuilder: (context, index) =>
                                const Gap(8.0),
                            itemCount: 10,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Gap(20),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  title: const Text('New Arraival'),
                  titleTextStyle: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                  trailing: Text(
                    'View All',
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductFetchSuccess) {
                      return SliverGrid.builder(
                        itemCount: state.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: layout.width * 0.7),
                        itemBuilder: (context, index) => ProductCard(
                          onItemTap: () {
                            context.read<ProductBloc>().add(FetchSingleProduct(state.products[index].productId));
                            context.read<CategoryBloc>().add(FetchSingleCategory(state.products[index].categoryId ?? ''));
                            context.pushNamed(Routes.PRODUCT_DETAILS_ROUTE);
                          },
                          productName:
                              state.products[index].productName ?? 'Unknown',
                          productPrice: state.products[index].productPrice,
                          productThumbnail:
                              state.products[index].imageGallery?.first.url,
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: LoadingAnimationWidget.hexagonDots(
                              color: theme.colorScheme.primary, size: 35.w),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

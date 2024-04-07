import 'package:bloc_ecommerce/src/presentation/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/blocs.dart';
import '../../routes/route_pages.dart';
import '../../utils/asset_manager.dart';

class AddRevewScreen extends StatelessWidget {
  const AddRevewScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Reveiw',
          style: theme.textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton.filled(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(theme.colorScheme.surfaceVariant),
          ),
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<RatingBloc, RatingState>(
        builder: (context, state) {
          if (state is RatingInitial) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How was your experience ?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  TextField(
                    controller: state.reveiwController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        fillColor: theme.colorScheme.surfaceVariant,
                        filled: true,
                        hintText: 'Describe your experience?',
                        hintStyle: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        )),
                    maxLines: 10,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    'Star',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: context.read<RatingBloc>().rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) => context
                            .read<RatingBloc>()
                            .add(UpdateRatingPoint(rating)),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (state is RatingLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            );
          } else if (state is RatingSubmitSuccess) {
            return AlertDialog(
              title: Text(
                'Reveiw Submitted!',
                style: theme.textTheme.titleMedium,
              ),
              content: LottieBuilder.asset(AssetManager.SUCCESS_ANIM),
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (state is RatingSubmitSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thanks for submitting reveiw!',
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.onErrorContainer),
                ),
                backgroundColor: Colors.green,
              ),
            );

            Future.delayed(const Duration(seconds: 2), (){
              context.pushReplacement(Routes.EXPLORE_REVEIWS);
            });
          }

          if (state is RatingSubmitFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thanks for submitting reveiw!',
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.onErrorContainer),
                ),
                backgroundColor: theme.colorScheme.errorContainer,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<RatingBloc, RatingState>(
        builder: (context, state) {
          return FullWidthButton(
              onTap: () => state is RatingInitial
                  ? context.read<RatingBloc>().add(
                        SubmitReveiw(state.reveiwController.text, id),
                      )
                  : null,
              buttonChild: state is RatingLoading
                  ? LoadingAnimationWidget.staggeredDotsWave(
                      color: theme.colorScheme.onPrimaryContainer, size: 30)
                  : null,
              buttonText: 'Submit Reveiw');
        },
      ),
    );
  }
}

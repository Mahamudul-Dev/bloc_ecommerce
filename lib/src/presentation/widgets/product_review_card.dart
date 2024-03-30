import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../utils/asset_manager.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
    this.imageUrl,
    this.name,
    this.date,
    this.ratingPoint,
    this.review,
  });

  final String? imageUrl;
  final String? name;
  final String? date;
  final double? ratingPoint;
  final String? review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              imageUrl ?? AssetManager.THUMBNAIL_PLACEHOLDER,
            ),
          ),
          title: Text(
            name ?? 'Unknown',
            style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer,
                color: theme.colorScheme.outline,
                size: 15.w,
              ),
              Text(
                date ?? '',
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: theme.colorScheme.outline),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: ratingPoint?.toStringAsFixed(1),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' Rating',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    )
                  ],
                ),
              ),
              RatingBarIndicator(
                rating: ratingPoint ?? 0.0,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 15.0.w,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ReadMoreText(
            review ?? 'No Review Given',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimLines: 3,
            moreStyle: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500, color: theme.colorScheme.tertiary),
            lessStyle: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500, color: theme.colorScheme.tertiary),
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
          ),
        )
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/asset_manager.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.productThumbnail,
    required this.productName,
    this.productPrice,
    this.onItemTap,
    this.onItemDoubleTap,
  });

  final String? productThumbnail;
  final String productName;
  final double? productPrice;
  final void Function()? onItemTap;
  final void Function()? onItemDoubleTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onItemTap,
      onDoubleTap: onItemDoubleTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 3,
              child: CachedNetworkImage(imageUrl: productThumbnail ?? AssetManager.THUMBNAIL_PLACEHOLDER, fit: BoxFit.cover,)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
        
                  // price
                  Text(
                    productPrice == 0.0
                        ? 'Free'
                        : productPrice?.toStringAsFixed(2) ?? '',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

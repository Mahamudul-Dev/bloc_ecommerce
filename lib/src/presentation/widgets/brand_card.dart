import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: layout.width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surfaceVariant),
      child: Row(
        children: [
          
          CachedNetworkImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/24/Adidas_logo.png'),
          const Gap(7.0),
          Text(
            'Addidas',
            style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

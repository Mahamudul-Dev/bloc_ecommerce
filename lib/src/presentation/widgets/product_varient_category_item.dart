import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/models/models.dart';

class ProductVarientCategoryItem extends StatelessWidget {
  const ProductVarientCategoryItem({
    super.key,
    required this.title,
    required this.items
  });

  final String title;
  final List<VarientItem> items;


  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: layout.size.width * 0.16,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: items.length + 1 ,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Gap(10);
              }

              return AspectRatio(
                aspectRatio: 3 / 3,
                child: Card(
                  child: Center(
                    child: Text(
                      items[index-1].title ?? '',
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(10);
            },
          ),
        ),
      ],
    );
  }
}

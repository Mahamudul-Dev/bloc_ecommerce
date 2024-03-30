import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/asset_manager.dart';
import '../../utils/values.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: kBottomNavigationBarHeight,
      padding: EdgeInsets.symmetric(horizontal: layout.width * 0.05),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AssetManager.SEARCH_ICON, height: layout.height * 0.03, width: layout.width * 0.08),
                  const Gap(8.0),
                  Text(Values.SEARCHBAR_HINT, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),)
                ],
              ),
            ),
          ),

          const Gap(8.0),

          FloatingActionButton(onPressed: (){}, backgroundColor: theme.colorScheme.primary, child: Center(
            child: SvgPicture.asset(AssetManager.MIC_ICON),
          ),)
        ],
      ),
    );
  }
}

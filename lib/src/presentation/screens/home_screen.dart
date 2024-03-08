import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/values.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: const Text('${Values.GREETINGS} Bloc'),
            titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            subtitle: const Text(Values.WELCOME_SUB_TITLE),
            subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
          ),

          const Gap(20),

          CustomSearchBar(),

          const Gap(20),

          SizedBox(height: layout.width * 0.13, child: ListView.separated(scrollDirection: Axis.horizontal, itemBuilder: (context, index)=> BrandCard(), separatorBuilder: (context, index)=> const Gap(8.0), itemCount: 10))
        ],
      ),
    );
  }
}

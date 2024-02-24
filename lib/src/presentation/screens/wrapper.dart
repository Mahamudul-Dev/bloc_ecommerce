import 'package:bloc_ecommerce/src/blocs/wrapper/wrapper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BlocBuilder<WrapperCubit, int>(
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: context.read<WrapperCubit>().activeIndex,
            onDestinationSelected: (index)=> context.read<WrapperCubit>().changeIndex(index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.login), label: 'Login'),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_rounded), label: 'Account')
            ],
          );
        }
      ),
    );
  }
}

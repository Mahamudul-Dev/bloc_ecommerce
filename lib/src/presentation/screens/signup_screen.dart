import 'package:bloc_ecommerce/src/blocs/authentication/signup_bloc.dart';
import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../routes/route_pages.dart';
import '../../utils/values.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            BlocConsumer<SignupBloc, SignupState>(
              
              listener: (context, state){
                if(state is SignUpSuccess){
                  context.goNamed(Routes.HOME_ROUTE);
                }

                if(state is SignUpFailed){
                  Fluttertoast.showToast(msg: state.message);
                }
              },


              builder: (context, state) {
                if (state is SignupInitial) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: state.usernameController,
                          decoration: InputDecoration(
                            label: const Text('Username'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Username is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.emailController,
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Email is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.passwordController,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Password is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.confirmPasswordController,
                          decoration: InputDecoration(
                            label: const Text('Confirm Password'),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Password is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              TextButton(
                onPressed: () => context.pushNamed(Routes.LOGIN_ROUTE),
                child: Text(
                  Values.SIGN_IN_BUTTON_TEXT,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              )
            ],
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return FullWidthButton(
                buttonText: Values.SIGN_UP_BUTTON_TEXT,
                buttonChild: state is SignUpLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                onTap: () {
                  if(state is SignupInitial){
                    if (formKey.currentState!.validate()) {
                    context.read<SignupBloc>().add(RequestEmailSignUp(username: state.usernameController.text, email: state.emailController.text, password: state.passwordController.text, confirmPassword: state.confirmPasswordController.text));
                  }
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

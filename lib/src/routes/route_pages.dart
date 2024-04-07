// ignore_for_file: non_constant_identifier_names

import 'package:bloc_ecommerce/src/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/screens.dart';

part 'routes.dart';

class RoutePages {
  static final authService = AuthService();
  static final ROUTER = GoRouter(
    redirect: (context, state) {
      if (authService.checkLoginStatus()) {
        if (state.fullPath == Routes.LOGIN_ROUTE ||
            state.fullPath == Routes.REGISTER_ROUTE ||
            state.fullPath == Routes.WELCOME_ROUTE) {
          return Routes.HOME_ROUTE;
        } else {
          return state.fullPath;
        }
      } else {
        if (state.fullPath == Routes.LOGIN_ROUTE ||
            state.fullPath == Routes.REGISTER_ROUTE) {
          return state.fullPath;
        }
        return Routes.WELCOME_ROUTE;
      }
    },
    routes: [
      GoRoute(
          path: Routes.SPLASH_ROUTE,
          name: Routes.SPLASH_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashScreen())),
      GoRoute(
          path: Routes.WELCOME_ROUTE,
          name: Routes.WELCOME_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: WelcomeScreen())),
      GoRoute(
          path: Routes.LOGIN_ROUTE,
          name: Routes.LOGIN_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginScreen())),
      GoRoute(
          path: Routes.REGISTER_ROUTE,
          name: Routes.REGISTER_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SignupScreen())),
      GoRoute(
          path: Routes.PRODUCT_DETAILS_ROUTE,
          name: Routes.PRODUCT_DETAILS_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ProductDetailsScreen())),
      GoRoute(
          path: Routes.ADD_REVEIW,
          name: Routes.ADD_REVEIW,
          pageBuilder: (context, state) {
            final obj = state.extra as Map;
            print(obj);
            return MaterialPage(
                child: AddRevewScreen(
              id: obj['id'],
            ));
          }),
      GoRoute(
          path: Routes.EXPLORE_REVEIWS,
          name: Routes.EXPLORE_REVEIWS,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ExploreReveiwsScreen())),
      ShellRoute(
        builder: (context, state, child) => Wrapper(child: child),
        routes: [
          GoRoute(
              path: Routes.HOME_ROUTE,
              name: Routes.HOME_ROUTE,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: HomeScreen()))
        ],
      ),
    ],
  );
}

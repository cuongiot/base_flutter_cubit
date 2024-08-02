import 'dart:async';

import 'package:base_mvvm_cubit/core/utils/navigation_service.dart';
import 'package:base_mvvm_cubit/cubit/auth/auth_cubit.dart';
import 'package:base_mvvm_cubit/ui/screens/home/home.dart';
import 'package:base_mvvm_cubit/ui/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RouteUri {
  static const String splash = '/';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String home = '/home';
}

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
    routerNeglect: true,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const SizedBox(),
    routes: <GoRoute>[
      GoRoute(
        path: RouteUri.splash,
        redirect: (_, state) => RouteUri.home,
      ),
      GoRoute(
        path: RouteUri.login,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.home,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
    ],
    redirect: (_, state) {
      final isLogin = authCubit.state.isLogin;
      final bool loggingIn = state.matchedLocation == RouteUri.login;
      if (!isLogin) {
        return loggingIn ? null : RouteUri.login;
      }
      if (loggingIn) {
        return RouteUri.splash;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshSteram(authCubit.stream),
  );
}

class GoRouterRefreshSteram extends ChangeNotifier {
  GoRouterRefreshSteram(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

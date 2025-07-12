import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talksy/screens/auth/login_screen.dart';
import 'package:talksy/screens/splash_screen.dart';

final routerProvider = Provider<RouterProvider>((ref) {
  return RouterProvider();
});

class RouterProvider {
  final navigatorKey = GlobalKey<NavigatorState>();
  late GoRouter router;

  RouterProvider() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: SplashScreen.routeLocation,
      routes: [
        GoRoute(
          path: SplashScreen.routeLocation,
          name: SplashScreen.routeName,
          builder: (context, state) {
            return SplashScreen();
          },
        ),
        GoRoute(
          path: LoginScreen.routeLocation,
          name: LoginScreen.routeName,
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
      ],
    );
  }
}

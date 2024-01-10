import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/core/providers/auth_services_state_notifier.dart';
import 'package:flutter_go_router/src/error_screen.dart';
import 'package:flutter_go_router/src/home_screen.dart';
import 'package:flutter_go_router/src/shop/shop_detail_screen.dart';
import 'package:flutter_go_router/src/shop/shop_screen.dart';
import 'package:flutter_go_router/src/sign_in_out_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static AppRouter? _instance;
  final Ref _ref;

  const AppRouter._(this._ref);

  factory AppRouter({
    required Ref ref,
  }) {
    return _instance ??= AppRouter._(ref);
  }

  GoRouter config() {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const ErrorScreen(
        errorType: 'Error',
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'shop',
              name: 'shop',
              builder: (context, state) => const ShopScreen(),
              redirect: (context, state) {
                final authToken = _ref.watch(authServiceProvider);
                log("🟢 authToken = $authToken");

                if (authToken != null) {
                  return null;
                } else {
                  return '/error/please-sign-in';
                }
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => ShopDetailScreen(
                    produceName: state.uri.queryParameters['name'],
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/error/:type',
          name: 'error',
          builder: (context, state) => ErrorScreen(
            errorType: state.pathParameters['type'],
          ),
        ),
        GoRoute(
          path: '/sign-in-out',
          name: 'sign-in-out',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SignInOutScreen(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                // Slide down animation
                const begin = Offset(0.0, -1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOutCirc;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

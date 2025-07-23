import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/presentation/views/log_in_view.dart';
import 'package:restaurant/features/auth/presentation/views/sign_up_view.dart';

abstract class AppRoutes {
  static const String kLogInView = '/logInView';
  static const String kSignUpView = '/signUpView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LogInView();
        },
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return const SignUpView();
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo_impl.dart';
import 'package:restaurant/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:restaurant/features/auth/presentation/views/log_in_view.dart';
import 'package:restaurant/features/auth/presentation/views/sign_up_view.dart';
import 'package:restaurant/features/home/presentation/views/nav_bar.dart';

abstract class AppRoutes {
  static const String kLogInView = '/logInView';
  static const String kSignUpView = '/signUpView';
  static const String kNavBarView = '/navBar';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthBloc(AuthRepoImpl()),
            child: const LogInView(),
          );
        },
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthBloc(AuthRepoImpl()),
            child: const SignUpView(),
          );
        },
      ),
      GoRoute(
        path: kNavBarView,
        builder: (context, state) {
          return NavBarView();
        },
      ),
    ],
  );
}

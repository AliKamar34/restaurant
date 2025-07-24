import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/app_routes.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:restaurant/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:restaurant/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              GoRouter.of(context).pushReplacement(AppRoutes.kNavBarView);
              showToast(context, 'Sign up successful');
            } else if (state is RegisterFailuer) {
              showToast(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return CustomLoadinIndicator(
              isLoading: state is RegisterLoading ? true : false,
              child: SignUpViewBody(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_routes.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/features/auth/presentation/views/widgets/log_in_form.dart';
import 'package:restaurant/features/auth/presentation/views/widgets/welcome_section.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            WelcomeSection(),
            const SizedBox(height: 52),
            LogInForm(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyles.medium14(context),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kSignUpView);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyles.medium14(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

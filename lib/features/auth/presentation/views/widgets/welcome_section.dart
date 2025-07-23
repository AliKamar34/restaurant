import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text('Welome Back', style: TextStyles.medium24(context)),
        Text(
          'Please log in to continue',
          style: TextStyles.medium16(
            context,
          ).copyWith(color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }
}

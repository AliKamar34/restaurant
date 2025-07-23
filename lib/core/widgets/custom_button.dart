import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.0,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold18(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_colors.dart';

class CustomLoadinIndicator extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomLoadinIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        if (isLoading)
          Positioned.fill(
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.black.withAlpha(20)),
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

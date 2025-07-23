import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.lable,
    required this.hint,
    required this.icon,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.autovalidateMode,
  });
  final String lable;
  final String hint;
  final Widget icon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: TextStyles.medium16(context)),
        SizedBox(
          height: 70,
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            controller: controller,
            onSaved: onSaved,
            onChanged: onChanged,
            obscureText: isPassword,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              hintText: hint,
              errorStyle: TextStyles.medium14(context).copyWith(
                color: AppColors.importantButtonsBackgroundColor,
                height: 1,
              ),
              errorMaxLines: 1,
              hintStyle: TextStyles.medium16(
                context,
              ).copyWith(color: AppColors.secondaryTextColor),
              filled: true,
              fillColor: Colors.white,
              constraints: BoxConstraints(maxHeight: 55),
              border: border(),
              enabledBorder: border(),
              focusedBorder: border(),
              focusedErrorBorder: border(),
              prefixIcon: icon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

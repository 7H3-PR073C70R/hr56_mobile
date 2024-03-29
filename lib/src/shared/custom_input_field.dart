import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.label,
    this.isAuth = false,
    this.maxLines = 1,
    this.maxLength,
    this.onTap,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final String? label;
  final bool isAuth;
  final int maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.bodySmall?.copyWith(
              color: isAuth ? AppColors.whiteColor : AppColors.textColor,
              fontWeight: isAuth ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
          AppSpacing.verticalSpaceTiny,
        ],
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onTap: onTap,
          obscuringCharacter: '*',
          maxLines: maxLines,
          maxLength: maxLength,
          autovalidateMode: autovalidateMode,
          style: context.textTheme.displayLarge?.copyWith(
            fontSize: 14.fontSize,
            color: AppColors.textColor,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            counter: const SizedBox.shrink(),
            helperStyle: context.textTheme.bodyLarge?.copyWith(
              fontSize: 14.fontSize,
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}

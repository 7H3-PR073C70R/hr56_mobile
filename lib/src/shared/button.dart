import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.backgroundColor = AppColors.successColor,
    this.textColor = AppColors.whiteColor,
    this.textStyle,
    this.height = 48,
    this.width,
    this.border,
    required this.onPressed,
    required this.text,
  });

  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final double height;
  final double? width;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.radius),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 48.height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: border,
        ),
        child: Text(
          text,
          style: context.textTheme.displayLarge?.copyWith(
            fontSize: 16.fontSize,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

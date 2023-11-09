import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.backgroundColor = AppColors.successColor,
    this.textColor = AppColors.whiteColor,
    this.textStyle,
    this.height = 48,
    this.width,
    this.radius = 20,
    this.enable = true,
    this.isBusy = false,
    this.border,
    this.suffixIcon,
    this.prefixIcon,
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
  final double radius;
  final bool enable;
  final bool isBusy;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onPressed : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:
            enable ? backgroundColor : backgroundColor.withOpacity(.5),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.radius),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 48.height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: border,
        ),
        child: isBusy
            ? Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: textColor,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    AppSpacing.setHorizontalSpace(10),
                  ],
                  Text(
                    text,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 16.fontSize,
                      fontWeight: FontWeight.w600,
                      color: enable ? textColor : AppColors.whiteColor,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    AppSpacing.setHorizontalSpace(10),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}

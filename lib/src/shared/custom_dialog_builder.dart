import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';

class CustomDialogBuilder extends StatelessWidget {
  const CustomDialogBuilder({
    super.key,
    required this.child,
    this.buttonText,
    this.onPressed,
    this.radius = 10,
    this.showCloseIcon = true,
    this.buttonPadding,
    this.padding,
  });

  final Widget child;
  final String? buttonText;
  final VoidCallback? onPressed;
  final double radius;
  final EdgeInsets? buttonPadding;
  final EdgeInsets? padding;
  final bool showCloseIcon;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.radius),
      ),
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCloseIcon)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: CircleAvatar(
                    radius: 15.radius,
                    backgroundColor: AppColors.backgroundColor,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            AppSpacing.setVerticalSpace(14),
            child,
            AppSpacing.setVerticalSpace(24),
            if (onPressed != null && buttonText != null)
              Padding(
                padding: buttonPadding ?? EdgeInsets.zero,
                child: Button(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPressed!();
                  },
                  text: buttonText!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

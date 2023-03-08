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
  });

  final Widget child;
  final String? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.radius),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              Button(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed!();
                },
                text: buttonText!,
              ),
          ],
        ),
      ),
    );
  }
}

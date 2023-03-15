import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';

class SuccessModal extends StatelessWidget {
  const SuccessModal({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.text1,
    required this.text2,
    required this.imagePath,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final String text1;
  final String text2;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.setVerticalSpace(30),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '$text1 ',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 20.fontSize,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: text2,
                  style: const TextStyle(
                    color: AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.setVerticalSpace(24),
          Center(
            child: SizedBox(
              height: 255.height,
              width: 255.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.blackColor,
                      radius: 75.radius,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      imagePath,
                      height: 255.height,
                      width: 255.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(40),
          Button(
            onPressed: onPressed,
            text: buttonText,
          ),
          AppSpacing.setVerticalSpace(25),
        ],
      ),
    );
  }
}

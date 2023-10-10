import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.info,
          color: AppColors.primaryColor,
        ),
        AppSpacing.setHorizontalSpace(5),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.displayLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

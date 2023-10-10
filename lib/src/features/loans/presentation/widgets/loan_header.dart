import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class LoanHeader extends StatelessWidget {
  const LoanHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmptyAppBar(
          backgroundColor: AppColors.primaryColor,
          isDark: false,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          color: AppColors.primaryColor,
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.radius,
                backgroundColor: AppColors.greyColor,
                backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q='
                  'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3hWiW-pUQDnb&s',
                ),
              ),
              AppSpacing.setHorizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Isaiah Nwankwo',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 20.fontSize,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(4),
                  Text(
                    '2017BRG19',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 16.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

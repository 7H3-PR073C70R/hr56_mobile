import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class OnboardingQuestionnaireHeader extends StatelessWidget {
  const OnboardingQuestionnaireHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.primaryColor,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 53.radius,
                backgroundColor: AppColors.greyColor,
                backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q='
                  'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3hWiW-pUQDnb&s',
                ),
              ),
              Positioned(
                top: 64.height,
                left: 77.width,
                child: CircleAvatar(
                  radius: 19.5.radius,
                  backgroundColor: AppColors.whiteColor,
                  child: Center(
                    child: CircleAvatar(
                      radius: 14.radius,
                      backgroundColor: AppColors.greenColor,
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.setHorizontalSpace(26),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Isaiah Nwankwo',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 20.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
                AppSpacing.setVerticalSpace(3),
                Text(
                  'Isaiahnwankwo@gmail.com',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
                AppSpacing.setVerticalSpace(3),
                Text(
                  'Bridgegap Consults Limited',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 12.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFB5BCBF),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

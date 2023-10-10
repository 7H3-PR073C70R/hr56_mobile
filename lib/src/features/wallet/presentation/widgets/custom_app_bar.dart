import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class WalletAppBar extends StatelessWidget {
  const WalletAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.height,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 25.radius,
            backgroundImage: const NetworkImage(AppStrings.profileImage),
          ),
          AppSpacing.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Isaiah Nwankwo',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 16.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'Bridgegap Consults',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 11.fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              const Icon(Icons.notifications),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8.radius,
                  backgroundColor: AppColors.errorColor,
                  child: Center(
                    child: Text(
                      '3',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 12.fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

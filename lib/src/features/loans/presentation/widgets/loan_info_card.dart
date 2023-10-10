import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LoanInfoCard extends StatelessWidget {
  const LoanInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121.height,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 14, right: 24, left: 24, bottom: 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.radius),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: .6.radius,
            spreadRadius: .1.radius,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SvgImageAsset(
                AppAssetPath.forward,
              ),
              AppSpacing.setHorizontalSpace(12),
              Expanded(
                child: Text(
                  'Loan application form',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 20.fontSize,
                    color: AppColors.successColor,
                  ),
                ),
              ),
              const SvgImageAsset(
                AppAssetPath.pin,
                color: AppColors.errorColor,
              ),
            ],
          ),
          AppSpacing.verticalSpaceSmall,
          Text(
            'To proceed with application, staff is required to '
            'complete the loan application form.',
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

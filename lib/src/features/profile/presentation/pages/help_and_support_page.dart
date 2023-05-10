import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  static const routeName = 'help-and-support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Help & Support',
            ),
            AppSpacing.verticalSpaceMedium,
            Text(
              'Our team is always ready to help\n24/7.',
              textAlign: TextAlign.center,
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.fontSize,
                color: const Color(0xFF555656),
              ),
            ),
            AppSpacing.setVerticalSpace(25),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HelpCard(
                      title: 'How to request Leave',
                      description: 'Want to get leave',
                      imagePath: AppAssetPath.leaveSolid,
                    ),
                    AppSpacing.verticalSpaceMedium,
                    const HelpCard(
                      title: 'Payslip',
                      description: 'Have issues checking your payslip',
                      imagePath: AppAssetPath.payslipSolid,
                    ),
                    AppSpacing.verticalSpaceMedium,
                    const HelpCard(
                      title: 'How to request Loan',
                      description: 'Need a quick loan',
                      imagePath: AppAssetPath.loanSolid,
                    ),
                    AppSpacing.verticalSpaceMedium,
                    const HelpCard(
                      title: 'Wallet',
                      description: 'Seamless transactions',
                      imagePath: AppAssetPath.walletSolid,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpCard extends StatelessWidget {
  const HelpCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.radius),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF577179).withOpacity(.1),
            blurRadius: 44.radius,
            spreadRadius: 4.radius,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 36.height,
            width: 39.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.radius),
              color: const Color(0xFFCD3EF0).withOpacity(.3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgImageAsset(
                imagePath,
              ),
            ),
          ),
          AppSpacing.horizontalSpaceMedium,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to request Leave',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 14.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                Text(
                  'Want to get leave',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 12.fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B717C),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

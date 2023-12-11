import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/pages/appraisal_feedback_summary_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class AppraisalFeedbackPage extends StatelessWidget {
  const AppraisalFeedbackPage({super.key});

  static const routeName = 'appraisal-feedback';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Appraisal Request',
          ),
          AppSpacing.setVerticalSpace(23),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.width),
              children: [
                Text(
                  'Enhancing Excellence: Annual Employee Performance'
                  ' Review and Appraisal-August 25, 2023',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 14.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                AppSpacing.setVerticalSpace(25),
                Text(
                  'Improvements & Solutions',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                Text(
                  'PROVIDE AREAS WHERE HE/SHE NEED IMPROVEMENTs and Solutions.',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 13.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF808080),
                  ),
                ),
                AppSpacing.setVerticalSpace(22),
                Text(
                  'Recommended improvements',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                const CustomInputField(
                  hintText: 'Response',
                  maxLines: 6,
                ),
                AppSpacing.setVerticalSpace(22),
                Text(
                  'Recommended solutions',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                const CustomInputField(
                  hintText: 'Response',
                  maxLines: 6,
                ),
                AppSpacing.setVerticalSpace(54),
                Button(
                  onPressed: () => context.navigator
                      .pushNamed(AppraisalFeedbackSummaryPage.routeName),
                  text: 'Submit feedback',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

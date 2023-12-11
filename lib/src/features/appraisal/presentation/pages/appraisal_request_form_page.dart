// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/pages/appraisal_feedback_page.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class AppraisalRequestFormPage extends HookWidget {
  const AppraisalRequestFormPage({
    super.key,
  });

  static const routeName = 'appraisal-request-form';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);
    final selectedRadioIndex = useState(-1);
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Appraisal Request',
          ),
          AppSpacing.setVerticalSpace(23),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.width),
              child: Column(
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
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) => currentPage.value = value,
                      itemCount: 2,
                      itemBuilder: (_, index) => Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 14.height,
                              horizontal: 8.width,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.radius),
                              border: Border.all(color: const Color(0xFFCCCCCC)),
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Text(
                                  'Peer Appraisal for Nathaniel Test dev',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 14.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                AppSpacing.verticalSpaceMedium,
                                Text(
                                  'Question ${currentPage.value + 1} of 2',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 13.fontSize,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF808080),
                                  ),
                                ),
                                AppSpacing.verticalSpaceTiny,
                                Text(
                                  [
                                    'Was your colleague open to learning new skills and taking on new challenges?',
                                    'I have a good relationship with my colleagues.',
                                  ].elementAt(currentPage.value),
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 16.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                AppSpacing.setVerticalSpace(12),
                                if (currentPage.value == 0)
                                  const CustomInputField(
                                    maxLines: 12,
                                  )
                                else
                                  ...List.generate(
                                    4,
                                    (index) => Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () => selectedRadioIndex.value = index,
                                          behavior: HitTestBehavior.translucent,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 20.radius,
                                                width: 20.radius,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: selectedRadioIndex
                                                                .value ==
                                                            index
                                                        ? const Color(0xFF0671E0)
                                                        : const Color(0xFF89939E),
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  radius: 6.radius,
                                                  backgroundColor:
                                                      selectedRadioIndex.value ==
                                                              index
                                                          ? const Color(
                                                              0xFF0671E0,
                                                            )
                                                          : Colors.transparent,
                                                ),
                                              ),
                                              AppSpacing.horizontalSpaceSmall,
                                              Text(
                                                [
                                                  'Strongly Disagree',
                                                  'Disagree',
                                                  'Neither Agree Nor Disagree',
                                                  'Strongly Agree',
                                                ].elementAt(index),
                                                style: context
                                                    .textTheme.displayLarge
                                                    ?.copyWith(
                                                  fontSize: 14.fontSize,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (index != 3)
                                          AppSpacing.setVerticalSpace(23),
                                      ],
                                    ),
                                  ),
                                AppSpacing.setVerticalSpace(24),
                                Center(
                                  child: Button(
                                    width: 297.width,
                                    onPressed: () {
                                      if (currentPage.value + 1 < 2) {
                                        pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      } else {
                                        showDialog<dynamic>(
                                          context: context,
                                          builder: (ctx) =>
                                              const _StartAppraisalDialog(),
                                        );
                                      }
                                    },
                                    text: currentPage.value + 1 < 2
                                        ? 'Next'
                                        : 'Submit Appraisal',
                                  ),
                                ),
                                if (currentPage.value > 0) ...[
                                  AppSpacing.setVerticalSpace(24),
                                  Center(
                                    child: Button(
                                      width: 297.width,
                                      backgroundColor: AppColors.whiteColor,
                                      textColor: AppColors.successColor,
                                      border: Border.all(
                                        color: AppColors.successColor,
                                      ),
                                      onPressed: () {
                                        pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      },
                                      text: 'Previous',
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StartAppraisalDialog extends StatelessWidget {
  const _StartAppraisalDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 12.width,
      ),
      alignment: Alignment.center,
      backgroundColor: AppColors.whiteColor,
      insetAnimationCurve: Curves.bounceInOut,
      insetAnimationDuration: const Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.width),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.setVerticalSpace(14),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(),
                child: CircleAvatar(
                  radius: 12.radius,
                  backgroundColor: AppColors.blackColor,
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.setVerticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.width),
              child: Text(
                'Appraisal Submitted Successfully',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 16.fontSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            Text(
              'Hello ${locator<UserStorageService>().user?.firstName}, You '
              'are about to begin appraisal survey.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 14.fontSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF555555),
              ),
            ),
            AppSpacing.setVerticalSpace(34),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.width),
              child: Button(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.navigator.pushNamed(AppraisalFeedbackPage.routeName);
                },
                text: 'Continue to feedback',
              ),
            ),
            AppSpacing.setVerticalSpace(47),
          ],
        ),
      ),
    );
  }
}

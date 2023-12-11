// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/pages/appraisal_request_form_page.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class AppraisalRequestPage extends StatelessWidget {
  const AppraisalRequestPage({
    super.key,
  });

  static const routeName = 'appraisal-request';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Appraisal Request',
          ),
          AppSpacing.setVerticalSpace(34),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.width),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 12.height,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.radius),
                  border: Border.all(
                    color: const Color(0xFFCCCCCC),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.width,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Appraisal name',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 14.fontSize,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          AppSpacing.setHorizontalSpace(24),
                          Expanded(
                            child: Text(
                              'Status',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 14.fontSize,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const Divider(
                      color: Color(0xFFCCCCCC),
                      thickness: 1,
                    ),
                    AppSpacing.setVerticalSpace(16),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.width,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Enhancing Excellence: Annual Employee'
                                  ' Performance Review and Appraisal-August'
                                  ' 25, 2023',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 12.fontSize,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              AppSpacing.setHorizontalSpace(24),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 28.height,
                                      width: 75.width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.radius),
                                        color: AppraisalStatus
                                            .values[index % 3].backgroundColor,
                                      ),
                                      child: Text(
                                        AppraisalStatus.values[index % 3].name
                                            .capitalizeFirst,
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 12.fontSize,
                                          fontWeight: FontWeight.w500,
                                          color: AppraisalStatus
                                              .values[index % 3].textColor,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          showModalBottomSheet<dynamic>(
                                        context: context,
                                        backgroundColor: AppColors.whiteColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.radius),
                                          ),
                                        ),
                                        showDragHandle: true,
                                        builder: (ctx) => Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 38.height,
                                            horizontal: 24.width,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Appraisal Type:',
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 14.fontSize,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    'Peer Appraisal',
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 14.fontSize,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AppSpacing.setVerticalSpace(25),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Total Score:',
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 14.fontSize,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '48%',
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 14.fontSize,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AppSpacing.setVerticalSpace(25),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Status:',
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 14.fontSize,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 28.height,
                                                    width: 75.width,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        12.radius,
                                                      ),
                                                      color: AppraisalStatus
                                                          .values[index % 3]
                                                          .backgroundColor,
                                                    ),
                                                    child: Text(
                                                      AppraisalStatus
                                                          .values[index % 3]
                                                          .name
                                                          .capitalizeFirst,
                                                      style: context.textTheme
                                                          .displayLarge
                                                          ?.copyWith(
                                                        fontSize: 12.fontSize,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppraisalStatus
                                                            .values[index % 3]
                                                            .textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AppSpacing.setVerticalSpace(52),
                                              Button(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                  showDialog<dynamic>(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        const _StartAppraisalDialog(),
                                                  );
                                                },
                                                width: 310.width,
                                                text: 'Proceed',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.visibility,
                                        size: 20.radius,
                                        color: const Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (_, __) => Column(
                          children: [
                            AppSpacing.setVerticalSpace(12),
                            const Divider(
                              color: Color(0xFFCCCCCC),
                              thickness: 1,
                            ),
                            AppSpacing.setVerticalSpace(16),
                          ],
                        ),
                        itemCount: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           AppSpacing.setVerticalSpace(34),
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
              child: RichText(
                text: TextSpan(
                  text: 'Appraisal introduction:  ',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 16.fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'Peer Appraisal',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            Text(
              'Hello ${locator<UserStorageService>().user?.firstName}, You '
              'are about to begin your appraisal. Do ensure you attempt'
              ' all the questions.',
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
                  context.navigator
                      .pushNamed(AppraisalRequestFormPage.routeName);
                },
                text: 'Start Appraisal',
              ),
            ),
            AppSpacing.setVerticalSpace(47),
          ],
        ),
      ),
    );
  }
}

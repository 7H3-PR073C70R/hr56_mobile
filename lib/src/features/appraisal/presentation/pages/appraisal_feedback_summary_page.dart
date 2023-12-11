import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class AppraisalFeedbackSummaryPage extends HookWidget {
  const AppraisalFeedbackSummaryPage({super.key});

  static const routeName = 'appraisal-feedback-summary';

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final modelScrollController = useScrollController();
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Appraisal Request',
          ),
          AppSpacing.setVerticalSpace(23),
          Expanded(
            child: SingleChildScrollView(
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
                  AppSpacing.setVerticalSpace(18),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.height,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 267.height,
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
                              SizedBox(
                                width: 25.width,
                                child: Text(
                                  'S/N',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 14.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              AppSpacing.verticalSpaceSmall,
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Appraisal name',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
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
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
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
                          child: Scrollbar(
                            controller: scrollController,
                            scrollbarOrientation: ScrollbarOrientation.left,
                            child: ListView.separated(
                              controller: scrollController,
                              itemBuilder: (_, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.width,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 25.width,
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 12.fontSize,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    AppSpacing.verticalSpaceSmall,
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Was your colleague open to'
                                        ' learning new skills and taking'
                                        ' on new challenges?',
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
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
                                          Expanded(
                                            child: Container(
                                              height: 24.height,
                                              width: double.infinity,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.radius,
                                                ),
                                                color: AppColors.whiteColor,
                                                border: Border.all(),
                                              ),
                                              child: Text(
                                                '200',
                                                style: context
                                                    .textTheme.displayLarge
                                                    ?.copyWith(
                                                  fontSize: 12.fontSize,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          AppSpacing.horizontalSpaceSmall,
                                          GestureDetector(
                                            onTap: () {},
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
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.setVerticalSpace(30),
                  Button(
                    onPressed: () => showModalBottomSheet<dynamic>(
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
                            Text(
                              'Appraisal Response',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(33),
                            Scrollbar(
                              controller: modelScrollController,
                              scrollbarOrientation: ScrollbarOrientation.left,
                              child: ListView.separated(
                                controller: modelScrollController,
                                itemBuilder: (_, index) => Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Question ${index + 1}:',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 14.fontSize,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF808080),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AppSpacing.horizontalSpaceMedium,
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          index == 1
                                              ? 'XXXX-XXXX-XXXX'
                                              : 'test answer ignore',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 14.fontSize,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF2B2B2B),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (_, __) =>
                                    AppSpacing.setVerticalSpace(24),
                                itemCount: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    text: 'Submit feedback',
                  ),
                  AppSpacing.setVerticalSpace(30),
                  Text(
                    'Comments for Nathaniel test dev',
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
                    'Recommendation for Nathaniel test dev',
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
                  AppSpacing.setVerticalSpace(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

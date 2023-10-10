import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/profile_info.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class PayslipDetailsPage extends StatelessWidget {
  const PayslipDetailsPage({super.key});

  static const routeName = 'payslip-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.backgroundColor,
        isDark: false,
      ),
      body: Column(
        children: [
          const _Header(),
          AppSpacing.verticalSpaceLarge,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfo(
                    header: 'Payment Details',
                    titleTextStyle: _titleTextStyle(context),
                    headerTextStyle: _headerTextStyle(context),
                    descriptionTextStyle: _descriptionTextStyle(context),
                    dividerColor: AppColors.greyColor.withOpacity(.2),
                    titles: const [
                      'Payment period',
                      'Pay date',
                      'Upload ID',
                      'Lump sum',
                      'Gross Salary',
                    ],
                    descriptions: const [
                      'February',
                      '2023-02-28',
                      'CHD0014',
                      '65,324 .00',
                      '104,721,50',
                    ],
                  ),
                  ProfileInfo(
                    header: 'Personal Details',
                    titleTextStyle: _titleTextStyle(context),
                    headerTextStyle: _headerTextStyle(context),
                    descriptionTextStyle: _descriptionTextStyle(context),
                    dividerColor: AppColors.greyColor.withOpacity(.2),
                    titles: const [
                      'Employer Name',
                      'Designation',
                      'Account Number',
                      'Bank',
                      'Gross Salary',
                    ],
                    descriptions: const [
                      'Doh',
                      'Electrical Technician',
                      '1494564579',
                      'Access',
                      '104,721,50',
                    ],
                  ),
                  ProfileInfo(
                    header: 'Deductions',
                    titleTextStyle: _titleTextStyle(context),
                    headerTextStyle: _headerTextStyle(context),
                    descriptionTextStyle: _descriptionTextStyle(context),
                    dividerColor: AppColors.greyColor.withOpacity(.2),
                    titles: const [
                      'Meal Subsidy',
                      'Relief',
                      'Sun. OT. Hours',
                      'Housing',
                      'Medical',
                      'Pension',
                      'Absent',
                    ],
                    descriptions: const [
                      '11,374.00',
                      '200,000.00',
                      '40',
                      '13,000',
                      '12,000',
                      '3249',
                      '0',
                    ],
                  ),
                  ProfileInfo(
                    header: 'Earnings',
                    titleTextStyle: _titleTextStyle(context),
                    headerTextStyle: _headerTextStyle(context),
                    descriptionTextStyle: _descriptionTextStyle(context),
                    dividerColor: AppColors.greyColor.withOpacity(.2),
                    titles: const [
                      'Pay',
                      'Net pay',
                      'Sun work',
                      'No. of days',
                      'Sat. OT',
                      'Bonus',
                      'Lumpsum',
                      '13th month salary',
                      'Basic allowance',
                      'Ord. OT',
                      'Severance',
                    ],
                    descriptions: const [
                      '11,374.00',
                      '200,000.00',
                      '40',
                      '13,000',
                      '12,000',
                      '12,000',
                      '12,000',
                      '12,000',
                      '12,000',
                      '12,000',
                      '12,000',
                    ],
                  ),
                  Container(
                    height: 40.height,
                    width: double.infinity,
                    color: AppColors.greyColor.withOpacity(.2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle? _titleTextStyle(BuildContext context) =>
      context.textTheme.displayLarge?.copyWith(
        fontSize: 14.fontSize,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF6B777D),
      );

  TextStyle? _descriptionTextStyle(BuildContext context) =>
      context.textTheme.displayLarge?.copyWith(
        fontSize: 14.fontSize,
        fontWeight: FontWeight.w400,
      );
  TextStyle? _headerTextStyle(BuildContext context) =>
      context.textTheme.displayLarge?.copyWith(
        fontSize: 16.fontSize,
        fontWeight: FontWeight.w500,
      );
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35.radius),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.adaptive.arrow_back,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 36,
              bottom: 9,
              left: 24,
              right: 24,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32.radius,
                        backgroundImage: const NetworkImage(
                          AppStrings.profileImage,
                        ),
                      ),
                      AppSpacing.verticalSpaceSmall,
                      Text(
                        'Doh Meh',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 20.fontSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      AppSpacing.setVerticalSpace(2),
                      Text(
                        'Electrical Technician',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 14.fontSize,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFD2D7DA),
                        ),
                      ),
                      AppSpacing.setVerticalSpace(2),
                      Text(
                        'January 2023-02-28',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 14.fontSize,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFD2D7DA),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => showDialog<Widget>(
                    context: context,
                    builder: (ctx) => const _DownloadPDF(),
                  ),
                  child: const SvgImageAsset(
                    AppAssetPath.download,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DownloadPDF extends StatelessWidget {
  const _DownloadPDF();

  @override
  Widget build(BuildContext context) {
    return CustomDialogBuilder(
      child: Column(
        children: [
          Text(
            'Download Pay slip for January\n2033',
            textAlign: TextAlign.center,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 20.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSpacing.verticalSpaceLarge,
          Container(
            height: 52.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.radius),
              color: const Color(0xFFF5F4F4),
            ),
            child: Row(
              children: [
                Container(
                  height: 32.height,
                  width: 35.width,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.29.radius),
                    color: AppColors.blackColor,
                  ),
                  child: const SvgImageAsset(AppAssetPath.pdf),
                ),
                AppSpacing.horizontalSpaceSmall,
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'January 2023 pay slip.',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 15.fontSize,
                        fontWeight: FontWeight.w400,
                      ),
                      children: const [
                        TextSpan(
                          text: 'pdf',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.setVerticalSpace(30),
          Button(
            onPressed: () {},
            text: 'Download',
            prefixIcon: SizedBox(
              height: 24.radius,
              width: 24.radius,
              child: const SvgImageAsset(
                AppAssetPath.download,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

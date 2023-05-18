import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/beneficiary_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/review_transfer_details_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  static const routeName = 'transfer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarWithBackButton(
              text: 'Transfer',
            ),
            AppSpacing.setVerticalSpace(28.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Beneficiaries',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 18.fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2D2D2D),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.navigator.pushNamed(
                    BeneficiaryPage.routeName,
                  ),
                  child: Text(
                    'view all',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 14.fontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF039847),
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.verticalSpaceMedium,
            SizedBox(
              height: 85.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                  children: [
                    CircleAvatar(
                      radius: 26.5.radius,
                      backgroundColor: AppColors.greyColor,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 40.height,
                        ),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(2),
                    Text(
                      AppStrings.nameList[index].replaceFirst(' ', '\n'),
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.fontSize,
                        color: const Color(0xFF2D2D2D),
                      ),
                    ),
                  ],
                ),
                itemCount: AppStrings.nameList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    AppSpacing.horizontalSpaceMedium,
              ),
            ),
            AppSpacing.setVerticalSpace(32),
            const CustomDropDownButton(
              texts: ['Select bank'],
              hintText: 'Select bank',
              label: 'Bank',
            ),
            AppSpacing.setVerticalSpace(15),
            const CustomInputField(
              hintText: '0898675867586',
              label: 'Account number',
            ),
            AppSpacing.setVerticalSpace(15),
            Row(
              children: [
                CircleAvatar(
                  radius: 10.radius,
                  backgroundColor: const Color(0xFF039847),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                AppSpacing.setHorizontalSpace(10),
                Text(
                  'Victoria Abiala',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.fontSize,
                    color: const Color(0xFF039847),
                  ),
                ),
              ],
            ),
            AppSpacing.setVerticalSpace(23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save as beneficiary',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 14.fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF505050),
                  ),
                ),
                CupertinoSwitch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: const Color(0xFF0671E0),
                  thumbColor: AppColors.whiteColor,
                ),
              ],
            ),
            AppSpacing.setVerticalSpace(40),
            Button(
              onPressed: () => context.navigator.pushNamed(
                ReviewTransferDetailsPage.routeName,
              ),
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}

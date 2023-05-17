import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_pin_field.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  static const routeName = 'withdraw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarWithBackButton(text: 'Withdraw'),
              AppSpacing.setVerticalSpace(29.5),
              Text(
                'Withdrawal amount',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 18.fontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greenColor,
                ),
              ),
              AppSpacing.verticalSpaceTiny,
              Text(
                'Enter the amount you would like to withdraw below.',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 14.fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF505050),
                ),
              ),
              AppSpacing.setVerticalSpace(15),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF9E2FF).withOpacity(.5),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50.radius,
                      width: 50.radius,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF26726),
                      ),
                    ),
                    AppSpacing.setHorizontalSpace(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GTBANK PLC',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.fontSize,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          '(***** 22674)',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.fontSize,
                            color: const Color(0xFF3C3F47),
                          ),
                        ),
                        AppSpacing.setVerticalSpace(2),
                        Row(
                          children: [
                            Text(
                              'Recipient Name :',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.fontSize,
                                color: const Color(0xFF3C3F47),
                              ),
                            ),
                            const SvgImageAsset(AppAssetPath.verify),
                            AppSpacing.setHorizontalSpace(5.33),
                            Text(
                              'Isaiah Nwankwo',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.fontSize,
                                color: const Color(0xFF3C3F47),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 12.fontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF039847),
                    ),
                  ),
                  Text(
                    'Balance: ${AppStrings.naira}270,000.00',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 12.fontSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF96999B),
                    ),
                  ),
                ],
              ),
              AppSpacing.setVerticalSpace(6),
              SizedBox(
                height: 50.height,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      AppAssetPath.ngn,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 2,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              AppSpacing.setVerticalSpace(54),
              Button(
                onPressed: () {
                  showModalBottomSheet<Widget>(
                    context: context,
                    barrierColor: const Color(0xFF070707).withOpacity(
                      .3,
                    ),
                    isScrollControlled: true,
                    backgroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.radius),
                        topRight: Radius.circular(25.radius),
                      ),
                    ),
                    builder: (ctx) => EnterPinWithdrawModal(
                      onContinue: () {
                        Navigator.of(ctx).pop();
                        showModalBottomSheet<Widget>(
                          context: context,
                          barrierColor: const Color(0xFF070707).withOpacity(
                            .3,
                          ),
                          isScrollControlled: true,
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.radius),
                              topRight: Radius.circular(25.radius),
                            ),
                          ),
                          builder: (ctx) => const TransferResponse(
                            isSuccessful: true,
                          ),
                        );
                      },
                    ),
                  );
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransferResponse extends StatelessWidget {
  const TransferResponse({
    super.key,
    required this.isSuccessful,
  });

  final bool isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 482.height,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          AppSpacing.setVerticalSpace(10),
          Center(
            child: Container(
              height: 7.9.height,
              width: 80.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.radius),
                color: const Color(0xFFE6E5E4),
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(48),
          if (isSuccessful)
            const Center(
              child: SvgImageAsset(
                AppAssetPath.transferSuccessful,
              ),
            )
          else
            Container(
              height: 99.17.radius,
              width: 99.17.radius,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFBB1AB),
              ),
              child: const SvgImageAsset(AppAssetPath.transferUnsuccessful),
            ),
          AppSpacing.setVerticalSpace(34.45),
          Text(
            isSuccessful ? 'Withdrawal successful' : 'Withdrawal unsuccessful',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 18.fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E222B),
            ),
          ),
          AppSpacing.setVerticalSpace(8),
          if (isSuccessful)
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'You have withdrawn',
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.fontSize,
                  color: const Color(0xFF808285),
                ),
                children: [
                  TextSpan(
                    text: ' NGN 10,000 ',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.fontSize,
                      color: const Color(0xFF808285),
                    ),
                  ),
                  const TextSpan(
                    text: 'to your bank account',
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Text(
                'Your withdrawal cannot be processed at'
                ' this time die to insufficient balance, fund your'
                ' account and try again',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.fontSize,
                  color: const Color(0xFF505050),
                ),
              ),
            ),
          AppSpacing.setVerticalSpace(40),
          Button(
            onPressed: () => Navigator.of(context).pop(),
            text: isSuccessful ? 'Done' : 'Back to wallet',
          ),
        ],
      ),
    );
  }
}

class EnterPinWithdrawModal extends StatelessWidget {
  const EnterPinWithdrawModal({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 637.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.setVerticalSpace(10),
          Center(
            child: Container(
              height: 7.9.height,
              width: 80.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.radius),
                color: const Color(0xFFE6E5E4),
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(32.1),
          Text(
            'Enter your PIN',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 16.fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E222B),
            ),
          ),
          Text(
            'Enter your 4-Digit PIN to confirm transaction',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF808285),
            ),
          ),
          AppSpacing.verticalSpaceLarge,
          CustomPinField(
            onChanged: (_) {},
          ),
          AppSpacing.setVerticalSpace(40),
          Button(onPressed: onContinue, text: 'Confirm')
        ],
      ),
    );
  }
}

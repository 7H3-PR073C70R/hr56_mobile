// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/enter_pin_modal.dart';
import 'package:hr56_staff/src/shared/state_modal.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  static const routeName = 'withdraw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          final amount = double.tryParse(
                state.walletInfo?.availableBalance ?? '',
              ) ??
              0;
          return Padding(
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
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => showModalBottomSheet<Widget>(
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
                    builder: (ctx) => const SelectBankModal(),
                  ),
                  child: Container(
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
                              state.walletInfo?.bankName ?? '',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.fontSize,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              '(***** ${state.walletInfo?.accountNumber?.substring((state.walletInfo?.accountNumber?.length ?? 5) - 5)})',
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
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.fontSize,
                                    color: const Color(0xFF3C3F47),
                                  ),
                                ),
                                const SvgImageAsset(AppAssetPath.verify),
                                AppSpacing.setHorizontalSpace(5.33),
                                Text(
                                  state.walletInfo?.accountName ?? '',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
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
                      'Balance: ${AppStrings.naira}${amount.toAmount}',
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
                        onContinue: (_) {
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
                            builder: (ctx) => const StateModal(
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
          );
        },
      ),
    );
  }
}

class SelectBankModal extends StatelessWidget {
  const SelectBankModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Container(
          height: 440.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.setVerticalSpace(25),
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
              AppSpacing.setVerticalSpace(41.1),
              Text(
                'Select bank account',
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1E222B),
                  fontSize: 16.fontSize,
                ),
              ),
              AppSpacing.setVerticalSpace(32),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.walletInfo?.bankName ?? '',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 14.fontSize,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF1E222B),
                              ),
                            ),
                            Text(
                              state.walletInfo?.accountNumber ?? '',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 14.fontSize,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1E222B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        state.walletInfo?.accountNumber ?? '',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 14.fontSize,
                          color: const Color(0xFF1E222B),
                        ),
                      ),
                      AppSpacing.setHorizontalSpace(14),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF1E222B),
                      ),
                    ],
                  ),
                  itemCount: 1,
                  separatorBuilder: (__, _) => Column(
                    children: [
                      AppSpacing.verticalSpaceMedium,
                      Container(
                        height: 1.height,
                        width: double.infinity,
                        color: const Color(0xFFE6E6E7),
                      ),
                      AppSpacing.verticalSpaceLarge,
                    ],
                  ),
                ),
              ),
              AppSpacing.verticalSpaceLarge,
              SizedBox(
                width: 182.width,
                child: Button(
                  onPressed: () {},
                  text: 'Add  new bank',
                  textColor: const Color(0xFF00BC67),
                  backgroundColor: const Color(0xFFEAFFF4),
                  suffixIcon: const Icon(
                    Icons.add,
                    color: Color(0xFF00BC67),
                  ),
                ),
              ),
              AppSpacing.setVerticalSpace(77),
            ],
          ),
        );
      },
    );
  }
}

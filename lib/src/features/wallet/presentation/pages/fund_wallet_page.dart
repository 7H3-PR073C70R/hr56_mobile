// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/helper_function.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/summary_text.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class FundWalletPage extends StatelessWidget {
  const FundWalletPage({super.key});

  static const routeName = 'fund-wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(text: 'Fund wallet'),
            AppSpacing.setVerticalSpace(37),
            Column(
              children: FundWallet.values
                  .map(
                    (fund) => Padding(
                      padding: EdgeInsets.only(bottom: 16.radius),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => showModalBottomSheet<Widget>(
                          context: context,
                          barrierColor: const Color(0xFF070707).withOpacity(
                            .3,
                          ),
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                            minHeight: 460.height,
                            maxHeight: AppSpacing.screenHeight(context),
                          ),
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.radius),
                              topRight: Radius.circular(25.radius),
                            ),
                          ),
                          builder: (ctx) {
                            if (fund.isTransfer) {
                              return const BankTransferModal();
                            }
                            return const USSDModal();
                          },
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.radius),
                          ),
                          margin: EdgeInsets.zero,
                          elevation: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10.radius),
                              border: Border.all(
                                color: const Color(0xFFE6EEF8),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50.radius,
                                        width: 50.radius,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFBBF2BB)
                                              .withOpacity(.3),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF009A46),
                                          ),
                                        ),
                                        child: SvgImageAsset(fund.asset),
                                      ),
                                      AppSpacing.horizontalSpaceSmall,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              fund.title,
                                              style: context
                                                  .textTheme.displayLarge
                                                  ?.copyWith(
                                                fontSize: 16.fontSize,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            AppSpacing.verticalSpaceTiny,
                                            Text(
                                              fund.description,
                                              style: context
                                                  .textTheme.displayLarge
                                                  ?.copyWith(
                                                fontSize: 14.fontSize,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF808285),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class USSDModal extends HookWidget {
  const USSDModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final amount = useState('');
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Container(
          height: 589.height,
          width: double.infinity,
          padding: const EdgeInsets.all(24),
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
                'Type in the amount you want to add '
                'to your premium trust account and tap'
                ' the right USSD code below to dial it.',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 13.fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF2D2D2D),
                  height: 1.5,
                ),
              ),
              AppSpacing.setVerticalSpace(13),
              Text(
                'Amount',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 12.fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF039847),
                ),
              ),
              AppSpacing.setVerticalSpace(6),
              TextFormField(
                onChanged: (value) => amount.value = value,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    AppAssetPath.ngn,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              AppSpacing.verticalSpaceMedium,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final bank = state.banks[index];
                    return GestureDetector(
                      onTap: () async {
                        await openPhoneApp(
                            '*${bank.code ?? ''}*${amount.value.isEmpty ? 0 : amount.value}*'
                            '${state.walletInfo?.accountNumber ?? ''}#');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 44.radius,
                            width: 44.radius,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xFFA3B2C5,
                              ).withOpacity(
                                .37,
                              ),
                            ),
                            child: Image.network(bank.avatar ?? ''),
                          ),
                          AppSpacing.setHorizontalSpace(
                            12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bank.name ?? '',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 12.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(
                                      0xFF827D77,
                                    ),
                                  ),
                                ),
                                AppSpacing.setVerticalSpace(2),
                                Text(
                                  '*${bank.code ?? ''}*${amount.value.isEmpty ? 0 : amount.value}*'
                                  '${state.walletInfo?.accountNumber ?? ''}#',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 16.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(
                                      0xFF2D2D2D,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => AppSpacing.setVerticalSpace(20),
                  itemCount: state.banks.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BankTransferModal extends StatelessWidget {
  const BankTransferModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Container(
          height: 552.height,
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              AppSpacing.setVerticalSpace(10),
              Container(
                height: 7.9.height,
                width: 80.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.radius),
                  color: const Color(0xFFE6E5E4),
                ),
              ),
              AppSpacing.setVerticalSpace(44.1),
              Image.asset(
                AppAssetPath.transfer,
                height: 87.radius,
                width: 87.radius,
              ),
              AppSpacing.setVerticalSpace(30),
              Text(
                'Bank transfer',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 18.fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF2D2D2D),
                ),
              ),
              AppSpacing.verticalSpaceSmall,
              Text(
                'Money transfers sent to this '
                'bank account number will automatically'
                ' fund your premium trust account.',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 12.fontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF827D77),
                ),
              ),
              AppSpacing.verticalSpaceMedium,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 17.5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(
                    color: const Color(0xFFE6E6E7),
                  ),
                ),
                child: Column(
                  children: [
                    SummaryText(
                      name: 'Bank name',
                      title: state.walletInfo?.bankName ?? '',
                    ),
                    AppSpacing.setVerticalSpace(22),
                    SummaryText(
                      name: 'Account number',
                      title: state.walletInfo?.walletNumber ?? '',
                    ),
                    AppSpacing.setVerticalSpace(22),
                    SummaryText(
                      name: 'Account name',
                      title: state.walletInfo?.walletName ?? '',
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceLarge,
              Button(
                onPressed: () {
                  copyToClipboard(
                    'Bank name: ${state.walletInfo?.bankName ?? ''}\n'
                    'Account number: ${state.walletInfo?.accountNumber ?? ''}'
                    '\nbank name: ${state.walletInfo?.bankName ?? ''}\n',
                  );
                  context.showSnackBar(
                    message: 'Account details copied to clipboard',
                    type: SnackBarType.info,
                  );
                },
                text: 'Copy account details',
                suffixIcon: const SvgImageAsset(
                  AppAssetPath.copy,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

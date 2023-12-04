import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/enter_pin_modal.dart';
import 'package:hr56_staff/src/shared/summary_text.dart';

class ReviewTransferDetailsPage extends StatelessWidget {
  const ReviewTransferDetailsPage({super.key, required this.amount});

  static const routeName = 'review-transfer-details';

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            return Column(
              children: [
                const CustomAppBarWithBackButton(
                  text: 'Review details',
                ),
                AppSpacing.setVerticalSpace(38.5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFDDE3F9),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SummaryText(
                          name: 'Send money to',
                          title: state.accountLookup?.accountName ?? '',
                        ),
                        AppSpacing.verticalSpaceLarge,
                        SummaryText(
                          name: 'Account number',
                          title: state.accountLookup?.accountNumber ?? '',
                        ),
                        AppSpacing.verticalSpaceLarge,
                        SummaryText(
                          name: 'Bank',
                          title: state.banks
                                  .firstWhere(
                                    (element) =>
                                        element.code ==
                                        state.accountLookup?.bankCode,
                                    orElse: WalletBank.new,
                                  )
                                  .name ??
                              '',
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.setVerticalSpace(24),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFFDDE3F9),
                      ),
                    ),
                    child: Column(
                      children: [
                        SummaryText(
                          name: 'Amount',
                          title: double.tryParse(amount.replaceAll(',', ''))
                                  ?.toAmount ??
                              '0',
                        ),
                        AppSpacing.verticalSpaceLarge,
                        const SummaryText(
                          name: 'Service fee',
                          title: 'FREE',
                          titleColor: Color(0xFF039847),
                        ),
                        AppSpacing.verticalSpaceLarge,
                        SummaryText(
                          name: 'Total amount',
                          title: double.tryParse(amount.replaceAll(',', ''))
                                  ?.toAmount ??
                              '0',
                        ),
                      ],
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
                        onContinue: (value) => context.read<WalletBloc>().add(
                              WalletEvent.sendMoney(
                                SendMoneyParam(
                                  amount: amount.replaceAll(
                                    ',',
                                    '',
                                  ),
                                  type: 'Bank',
                                  account:
                                      state.accountLookup?.accountNumber ?? '',
                                  bankCode: state.accountLookup?.bankCode ?? '',
                                  accountName:
                                      state.accountLookup?.accountName ?? '',
                                  pin: value,
                                ),
                              ),
                            ),
                      ),
                    );
                  },
                  text: 'Confirm',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

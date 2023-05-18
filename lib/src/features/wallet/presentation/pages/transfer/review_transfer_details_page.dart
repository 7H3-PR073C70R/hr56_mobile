import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/enter_pin_modal.dart';
import 'package:hr56_staff/src/shared/state_modal.dart';
import 'package:hr56_staff/src/shared/summary_text.dart';

class ReviewTransferDetailsPage extends StatelessWidget {
  const ReviewTransferDetailsPage({super.key});

  static const routeName = 'review-transfer-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
        child: Column(
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
                    const SummaryText(
                      name: 'Send money to',
                      title: 'VICTORIA ABIALA',
                    ),
                    AppSpacing.verticalSpaceLarge,
                    const SummaryText(
                      name: 'Account number',
                      title: '02111910292',
                    ),
                    AppSpacing.verticalSpaceLarge,
                    const SummaryText(
                      name: 'Bank',
                      title: 'Access bank',
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
                    const SummaryText(
                      name: 'Amount',
                      title: '₦100',
                    ),
                    AppSpacing.verticalSpaceLarge,
                    const SummaryText(
                      name: 'Service fee',
                      title: 'FREE',
                      titleColor: Color(0xFF039847),
                    ),
                    AppSpacing.verticalSpaceLarge,
                    const SummaryText(
                      name: 'Total amount',
                      title: '₦100',
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.setVerticalSpace(54),
            Button(
              onPressed: () => showModalBottomSheet<Widget>(
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
              ),
              text: 'Confirm',
            )
          ],
        ),
      ),
    );
  }
}

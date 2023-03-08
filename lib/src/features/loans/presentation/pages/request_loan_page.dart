import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/verify_account_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_header.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_info_card.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';

class RequestLoanPage extends StatelessWidget {
  const RequestLoanPage({super.key});

  static const routeName = 'request-loan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const LoanHeader(),
          AppSpacing.setVerticalSpace(12),
          const LoanInfoCard(),
          AppSpacing.setVerticalSpace(12),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const CustomInputField(
                    label: 'Loan amount',
                    hintText: '20,000',
                  ),
                  AppSpacing.setVerticalSpace(12),
                  const CustomInputField(
                    label: 'Repayment Amount',
                    hintText: '20,000',
                  ),
                  AppSpacing.setVerticalSpace(12),
                  const CustomInputField(
                    label: 'Reason for loan',
                    hintText: 'House rent',
                  ),
                  AppSpacing.setVerticalSpace(40),
                  Button(
                    onPressed: () {
                      showDialog<Widget>(
                        context: context,
                        builder: (ctx) => CustomDialogBuilder(
                          buttonText: 'Continue',
                          onPressed: () => context.navigator.pushNamed(
                            VerifyAccountPage.routeName,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Note:',
                                style: context.textTheme.displayLarge
                                    ?.copyWith(fontSize: 16.fontSize),
                              ),
                              AppSpacing.setVerticalSpace(12),
                              Text(
                                'You have requested for 20% of your '
                                'net salary which will be deducted '
                                'automatically from your next salary.',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 14.fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    text: 'Submit form',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

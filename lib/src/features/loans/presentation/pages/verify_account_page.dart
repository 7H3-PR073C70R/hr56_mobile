import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_form_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_header.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_info_card.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_check_box.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/info_text.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

  static const routeName = 'verify-account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoanHeader(),
          AppSpacing.setVerticalSpace(12),
          const LoanInfoCard(),
          AppSpacing.setVerticalSpace(29),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Verify Account',
              style: context.textTheme.displayLarge
                  ?.copyWith(fontSize: 16.fontSize),
            ),
          ),
          AppSpacing.setVerticalSpace(12),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const CustomInputField(
                    label: 'Account Number',
                    hintText: '08997758658',
                  ),
                  AppSpacing.setVerticalSpace(12),
                  const CustomInputField(
                    label: 'Bank Name',
                    hintText: 'Access bank',
                  ),
                  AppSpacing.setVerticalSpace(12),
                  const CustomInputField(
                    label: 'Request Amount',
                    hintText: '270,000',
                  ),
                  AppSpacing.setVerticalSpace(12),
                  const CustomInputField(
                    label: 'Repayment Amount',
                    hintText: '270,000',
                  ),
                  AppSpacing.setVerticalSpace(8),
                  const InfoText(
                    text: 'Interest rate is 5% per month.',
                  ),
                  AppSpacing.setVerticalSpace(19),
                  const CustomCheckBox(
                    text: 'Edit Account details',
                    value: true,
                  ),
                  AppSpacing.setVerticalSpace(53),
                  Button(
                    onPressed: () {
                      showDialog<Widget>(
                        context: context,
                        builder: (ctx) => CustomDialogBuilder(
                          child: Text(
                            'Contact your Human resource manager to '
                            'edit your account details',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 16.fontSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ).whenComplete(
                        () => context.navigator.pushNamed(
                          LoanFormPage.routeName,
                        ),
                      );
                    },
                    text: 'Submit form',
                  ),
                  AppSpacing.setVerticalSpace(19),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

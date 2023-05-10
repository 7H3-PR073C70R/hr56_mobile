import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_header.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_check_box.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/info_text.dart';

class LoanFormPage extends HookWidget {
  const LoanFormPage({super.key});

  static const routeName = 'loan-form';
  @override
  Widget build(BuildContext context) {
    final consent = useState(false);
    return Scaffold(
      body: Column(
        children: [
          const LoanHeader(),
          AppSpacing.setVerticalSpace(15),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(19),
              child: Column(
                children: [
                  Image.asset(AppAssetPath.loan),
                  AppSpacing.setVerticalSpace(15),
                  CustomCheckBox(
                    value: consent.value,
                    onChanged: (value) => consent.value = value,
                    textWidget: RichText(
                      text: TextSpan(
                        text: 'I ',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 13.fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        children: const [
                          TextSpan(
                            text: 'TOBI .D HASSAN  ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'hereby, instruct BridgeGap consults '
                                'Limited to deduct the sum of ',
                          ),
                          TextSpan(
                            text: 'Twelve Thousand Six Hundred Naira, Zero'
                                ' Kobo (NGN12,600.00) ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                'being repayment of salary advance (loan) from '
                                'my from my next salary and make onward '
                                'payment to the lending Organization.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(24),
                  Button(
                    onPressed: () {
                      showDialog<Widget>(
                        context: context,
                        builder: (ctx) => CustomDialogBuilder(
                          buttonText: 'Submit',
                          onPressed: () {
                            showDialog<Widget>(
                              context: context,
                              builder: (ctx) => CustomDialog(
                                title: 'Loan Application Completed',
                                description: 'your loan request has been '
                                    'successfully submitted.',
                                onActionPressed: () {
                                  Navigator.of(ctx).pop();
                                  context.popUntilMain();
                                },
                                actionText: 'Back to home',
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              const CustomInputField(
                                label: 'Signature',
                              ),
                              AppSpacing.setVerticalSpace(9),
                              const InfoText(
                                text: 'Please type in your full names.',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    text: 'Submit form',
                    enable: consent.value,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

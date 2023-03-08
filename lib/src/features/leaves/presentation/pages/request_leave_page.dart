import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class RequestLeavePage extends StatelessWidget {
  const RequestLeavePage({super.key});

  static const routeName = 'request-leave';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Request Leave',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(13),
                    const CustomDropDownButton(
                      texts: [
                        'Parental leave (max 10 days)',
                      ],
                      label: 'Company type of leave',
                      hintText: '9',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'How long are you going to take (days)',
                      hintText: '9',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'The relived',
                      hintText: 'Tobi Hassan',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const DatePickerFormCard(
                      label: 'Proposed date of leave',
                      hintText: '12/3/2023',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Purpose for leave request',
                      hintText: 'period leave i have my period and i am'
                          ' taking a mandatory, leave.',
                      maxLines: 10,
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        showDialog<Widget>(
                          context: context,
                          builder: (ctx) => CustomDialogBuilder(
                            buttonText: 'Proceed',
                            child: Text(
                              'You have selected 9 day(s) out of 10'
                              ' day(s) parental  leave, you have 1 day(s)'
                              ' left.',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 15.fontSize,
                                color: const Color(0xFF778790),
                              ),
                            ),
                            onPressed: () => showDialog<Widget>(
                              context: context,
                              builder: (ctx) => CustomDialog(
                                title: 'Leave Request Submitted',
                                description: 'Your leave request '
                                    'has been submitted  for review.',
                                actionText: 'Back home',
                                onActionPressed: () {
                                  Navigator.of(ctx).pop();
                                  isAdded.value = true;
                                  context.popUntilMain();
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      text: 'Submit request',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

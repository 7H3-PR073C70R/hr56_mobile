import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key});

  static const routeName = 'reference';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Reference',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    const CustomInputField(
                      label: 'Name',
                      hintText: 'Tobi',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Email',
                      hintText: 'hassan@hassan.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Address',
                      hintText: 'Somewhere on earth, Lagos.',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Phone number',
                      hintText: '0909656758675',
                      keyboardType: TextInputType.phone,
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Job role',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Company name',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Job department',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const DatePickerFormCard(
                      label: 'Employment start date',
                      hintText: '9/3/2023',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const DatePickerFormCard(
                      label: 'Employment end date',
                      hintText: '9/3/2023',
                    ),
                    AppSpacing.setVerticalSpace(9),
                    const CustomInputField(
                      label: 'Exit reason',
                      hintText: 'reason...',
                      maxLines: 10,
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () => context.navigator.pop(),
                      text: 'Add Reference',
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

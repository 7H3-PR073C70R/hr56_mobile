import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class GuarantorPage extends StatelessWidget {
  const GuarantorPage({super.key});

  static const routeName = 'guarantor';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Guarantor',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    const CustomInputField(
                      label: 'First name',
                      hintText: 'Tobi',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Last name',
                      hintText: 'Hassan',
                    ),
                    
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Phone number',
                      hintText: '012012656758675',
                      keyboardType: TextInputType.phone,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Address',
                      hintText: 'Somewhere on earth, Lagos.',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () => context.navigator.pop(),
                      text: 'Add Guarantor',
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

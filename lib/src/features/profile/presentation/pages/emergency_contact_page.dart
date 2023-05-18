import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class EmergencyContactPage extends StatelessWidget {
  const EmergencyContactPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  static const routeName = 'emergency-contact';

  final bool isAfterLogin;
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppBarWithBackButton(
              onNavigateBack: controller == null
                  ? null
                  : () => UserInformation.emergency.navigateBack(controller!),
              text: 'Emergency contact',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    Text(
                      'Emergency Contact  1',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const EmergencyContactForm(),
                    AppSpacing.setVerticalSpace(24),
                    Text(
                      'Emergency Contact  2',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const EmergencyContactForm(),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.emergency,
                            controller,
                          );
                        } else {
                          context.navigator.pop();
                        }
                      },
                      text: 'Add Contact',
                    ),
                    AppSpacing.setVerticalSpace(20),
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

class EmergencyContactForm extends StatelessWidget {
  const EmergencyContactForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AppSpacing.setVerticalSpace(12),
        const CustomInputField(
          label: 'Email Address',
          hintText: 'example@example.com',
          keyboardType: TextInputType.emailAddress,
        ),
        AppSpacing.setVerticalSpace(12),
        CustomDropDownButton(
          label: 'Relationship with contact',
          texts: const [
            'Mother',
            'Father',
            'Uncle',
            'Aunt',
            'Others',
          ],
          onChanged: (_) {},
        ),
      ],
    );
  }
}

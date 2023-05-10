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

class GuarantorPage extends StatelessWidget {
  const GuarantorPage({super.key, this.isAfterLogin = false});

  static const routeName = 'guarantor';

  final bool isAfterLogin;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    Text(
                      'Guarantor 1',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const GuarantorForm(),
                    AppSpacing.setVerticalSpace(24),
                    Text(
                      'Guarantor 2',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const GuarantorForm(),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.guarantor,
                          );
                        } else {
                          context.navigator.pop();
                        }
                      },
                      text: 'Add Guarantor',
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

class GuarantorForm extends StatelessWidget {
  const GuarantorForm({
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
          label: 'Relationship with guarantor',
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

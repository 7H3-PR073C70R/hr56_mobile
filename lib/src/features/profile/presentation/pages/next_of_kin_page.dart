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

class NextOfKinPage extends StatelessWidget {
  const NextOfKinPage({super.key, this.isAfterLogin = false});

  final bool isAfterLogin;

  static const routeName = 'next-of-kin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Next of kin',
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
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Email Address',
                      hintText: 'example@example.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    CustomDropDownButton(
                      label: 'Relationship with next of kin',
                      texts: const [
                        'Mother',
                        'Father',
                        'Uncle',
                        'Aunt',
                        'Others',
                      ],
                      onChanged: (_) {},
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.nextOfKin,
                          );
                        } else {
                          context.navigator.pop();
                        }
                      },
                      text: 'Save changes',
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

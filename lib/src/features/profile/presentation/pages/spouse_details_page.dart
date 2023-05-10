import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class SpouseDetailsPage extends HookWidget {
  const SpouseDetailsPage({super.key, this.isAfterLogin = false});

  static const routeName = 'spouse-details';

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
              text: 'Spouse details',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    const CustomInputField(
                      label: 'State of residence',
                      hintText: 'Cyprus',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Spouse name',
                      hintText: 'N/A',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Spouse phone number',
                      hintText: 'N/A',
                      keyboardType: TextInputType.phone,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Spouse address',
                      hintText: 'N/A',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.spouse,
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

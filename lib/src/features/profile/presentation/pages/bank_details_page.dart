import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class BankDetailsPage extends StatelessWidget {
  const BankDetailsPage({super.key, this.isAfterLogin = false});

  final bool isAfterLogin;

  static const routeName = 'bank-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Bank details',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    const CustomInputField(
                      label: 'Bank name',
                      hintText: 'Tobi',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Bank account number',
                      hintText: '0126888787',
                      keyboardType: TextInputType.number,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Bank account name',
                      hintText: 'Tobi Hassan',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'National identity number',
                      hintText: '224127707070708012',
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(context, UserInformation.bank);
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

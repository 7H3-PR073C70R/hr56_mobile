import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({
    super.key,
    this.isAfterLogin = false,
  });

  final bool isAfterLogin;

  static const routeName = 'personal-info';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Personal information',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSpacing.setVerticalSpace(25),
                    const CustomInputField(
                      label: 'Phone number',
                      hintText: '0909567858656',
                      keyboardType: TextInputType.phone,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Phone number 2',
                      hintText: '012012656758675',
                      keyboardType: TextInputType.phone,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    CustomDropDownButton(
                      label: 'Gender',
                      texts: const ['Male', 'Female'],
                      onChanged: (_) {},
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Address',
                      hintText: '23 finance quatres, Kublai , Abuja.',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const DatePickerFormCard(
                      label: 'Date of birth',
                      hintText: '23/06/1993',
                    ),
                    AppSpacing.setVerticalSpace(12),
                    CustomDropDownButton(
                      label: 'Marital status',
                      texts: const [
                        'Single',
                        'Married',
                        'Divorced',
                      ],
                      onChanged: (_) {},
                    ),
                    AppSpacing.setVerticalSpace(12),
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
                    ),
                    AppSpacing.setVerticalSpace(12),
                    const CustomInputField(
                      label: 'Spouse address',
                      hintText: 'N/A',
                    ),
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.personal,
                          );
                        } else {
                          context.navigator.pop();
                        }
                      },
                      text: 'Save changes',
                    ),
                    AppSpacing.setVerticalSpace(25),
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

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key, this.isAfterLogin = false});

  final bool isAfterLogin;

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
                    AppSpacing.setVerticalSpace(40),
                    Button(
                      onPressed: () {
                        if (isAfterLogin) {
                          showInfoCustomModel(
                            context,
                            UserInformation.reference,
                          );
                          // showDialog<Widget>(
                          //   context: context,
                          //   builder: (ctx) => CustomDialogBuilder(
                          //     showCloseIcon: false,
                          //     radius: 20,
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 24,
                          //       vertical: 15,
                          //     ),
                          //     buttonPadding: const EdgeInsets.symmetric(
                          //       horizontal: 18,
                          //     ),
                          //     buttonText: 'Home page',
                          //     onPressed: () => context.navigator
                          //         .replaceNamed(MainPage.routeName),
                          //     child: Column(
                          //       children: [
                          //         Image.asset(
                          //           AppAssetPath.personalInfoSuccess,
                          //           width: 111.width,
                          //           height: 111.height,
                          //           fit: BoxFit.contain,
                          //         ),
                          //         AppSpacing.setVerticalSpace(20),
                          //         Text(
                          //           'Staff details Saved',
                          //           style: context.textTheme.displayLarge
                          //               ?.copyWith(
                          //             fontSize: 20.fontSize,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         AppSpacing.setVerticalSpace(12),
                          //         Text(
                          //           'Staff details has been successfully'
                          //           ' saved you can always update them on'
                          //           ' your profile',
                          //           textAlign: TextAlign.center,
                          //           style: context.textTheme.displayLarge
                          //               ?.copyWith(
                          //             fontSize: 15.fontSize,
                          //             fontWeight: FontWeight.w400,
                          //             color: const Color(0xFF3E4F59),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        } else {
                          context.navigator.pop();
                        }
                      },
                      text: 'Add Reference',
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

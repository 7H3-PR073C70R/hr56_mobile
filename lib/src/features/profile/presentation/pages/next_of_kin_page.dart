import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/next_of_kin/next_of_kin_param.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class NextOfKinPage extends HookWidget {
  const NextOfKinPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  final bool isAfterLogin;
  final PageController? controller;

  static const routeName = 'next-of-kin';
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final age = useTextEditingController();
    final emailAddress = useTextEditingController();
    final firstName = useTextEditingController();
    final lastName = useTextEditingController();
    final middleName = useTextEditingController();
    final phoneNumber2 = useTextEditingController();
    final phoneNumber = useTextEditingController();
    final relationship = useState<String?>(null);
    final residentialAddress = useTextEditingController();
    return BlocProvider<AuthenticationBloc>(
      create: (context) => locator<AuthenticationBloc>(),
      child: Scaffold(
        appBar: const EmptyAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) {
              if (previous.viewState.isProcessing &&
                  current.viewState.isSuccess) {
                if (isAfterLogin) {
                  showInfoCustomModel(
                    context,
                    UserInformation.nextOfKin,
                    controller,
                  );
                } else {
                  context.navigator.pop();
                }
              } else if (previous.viewState.isProcessing &&
                  current.viewState.isError) {
                context.showErrorSnackBar(
                  message: current.errorMessage ?? 'Something went wrong',
                );
              }
              return true;
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomAppBarWithBackButton(
                    text: 'Next of kin',
                    onNavigateBack: controller == null
                        ? null
                        : () =>
                            UserInformation.nextOfKin.navigateBack(controller!),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppSpacing.setVerticalSpace(25),
                            CustomInputField(
                              label: 'First name',
                              hintText: 'Tobi',
                              controller: firstName,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Last name',
                              hintText: 'Hassan',
                              controller: lastName,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Middle name',
                              hintText: 'Dan',
                              controller: middleName,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Middle name',
                              hintText: 'Age',
                              keyboardType: TextInputType.number,
                              controller: age,
                              maxLength: 2,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Phone number',
                              hintText: '012012656758675',
                              keyboardType: TextInputType.phone,
                              controller: phoneNumber,
                              validator: context.validatePhoneNumber,
                              maxLength: 11,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Alternative Phone number',
                              hintText: '012012656758675',
                              keyboardType: TextInputType.phone,
                              controller: phoneNumber2,
                              validator: context.validatePhoneNumber,
                              maxLength: 11,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Address',
                              hintText: 'Somewhere on earth, Lagos.',
                              keyboardType: TextInputType.streetAddress,
                              controller: residentialAddress,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Email Address',
                              hintText: 'example@example.com',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailAddress,
                              validator: context.validateEmailAddress,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomDropDownButton(
                              label: 'Relationship with next of kin',
                              texts: RelationShip.values
                                  .map((e) => e.name.capitalizeFirst)
                                  .toList(),
                              value: relationship.value,
                              onChanged: (value) {
                                relationship.value = value;
                              },
                            ),
                            AppSpacing.setVerticalSpace(40),
                            Button(
                              isBusy: state.viewState.isProcessing,
                              enable: relationship.value != null,
                              onPressed: () {
                                if (relationship.value == null) {
                                  context.showSnackBar(
                                    message: 'Please select a relationship',
                                    type: SnackBarType.info,
                                  );
                                  return;
                                }
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.addNextOfKin(
                                          NextOfKinParam(
                                            age: age.text,
                                            emailAddress: emailAddress.text,
                                            firstName: firstName.text,
                                            lastName: lastName.text,
                                            middleName: middleName.text,
                                            phoneNumber2: phoneNumber2.text,
                                            phoneNumber: phoneNumber.text,
                                            relationship: relationship.value
                                                ?.replaceAll('_', '-')
                                                .toLowerCase(),
                                            residentialAddress:
                                                residentialAddress.text,
                                          ),
                                        ),
                                      );
                                }
                              },
                              text: 'Save changes',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class SpouseDetailsPage extends HookWidget {
  const SpouseDetailsPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
    this.personalDetails,
  });

  static const routeName = 'spouse-details';

  final bool isAfterLogin;
  final PageController? controller;
  final ValueNotifier<UpdatePersonalDetailsParam?>? personalDetails;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final spouseAddressController = useTextEditingController();
    final spouseEmailAddress = useTextEditingController();
    final spouseNameController = useTextEditingController();
    final spousePhoneNumberController = useTextEditingController();

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
                    UserInformation.spouse,
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
                    text: 'Spouse details',
                    onNavigateBack: controller == null
                        ? null
                        : () =>
                            UserInformation.spouse.navigateBack(controller!),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppSpacing.setVerticalSpace(25),
                            const CustomInputField(
                              label: 'State of residence',
                              hintText: 'Cyprus',
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Spouse name',
                              hintText: 'N/A',
                              validator: context.validateFieldNotEmpty,
                              controller: spouseNameController,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Spouse phone number',
                              hintText: 'N/A',
                              keyboardType: TextInputType.phone,
                              validator: context.validatePhoneNumber,
                              controller: spousePhoneNumberController,
                              maxLength: 11,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Email Address',
                              hintText: 'N/A',
                              keyboardType: TextInputType.emailAddress,
                              validator: context.validateEmailAddress,
                              controller: spouseEmailAddress,
                            ),
                            AppSpacing.setVerticalSpace(12),
                            CustomInputField(
                              label: 'Spouse address',
                              hintText: 'N/A',
                              keyboardType: TextInputType.streetAddress,
                              validator: context.validateFieldNotEmpty,
                              controller: spouseAddressController,
                            ),
                            AppSpacing.setVerticalSpace(40),
                            Button(
                              isBusy: state.viewState.isProcessing,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.updatePersonalInfo(
                                          param: personalDetails?.value
                                                  ?.copyWith(
                                                spouseAddress:
                                                    spouseAddressController
                                                        .text,
                                                spouseEmailAddress:
                                                    spouseEmailAddress.text,
                                                spouseName:
                                                    spouseNameController.text,
                                                spousePhoneNumber:
                                                    spousePhoneNumberController
                                                        .text,
                                              ) ??
                                              const UpdatePersonalDetailsParam(),
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

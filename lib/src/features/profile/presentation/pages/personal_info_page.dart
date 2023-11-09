import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/app/bloc/app_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:intl/intl.dart';

class PersonalInfoPage extends HookWidget {
  const PersonalInfoPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
    this.personalDetails,
  });

  final bool isAfterLogin;
  final PageController? controller;
  final ValueNotifier<UpdatePersonalDetailsParam?>? personalDetails;

  static const routeName = 'personal-info';
  @override
  Widget build(BuildContext context) {
    final isMarried = useState(false);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final selectedGender = useState<String?>(null);
    final selectedStates = useState<String?>(null);
    final dob = useState<DateTime?>(null);
    final selectedMaritalStatus = useState<String?>(null);
    final selectedIdentification = useState<String?>(null);
    final phoneController = useTextEditingController();
    final alternativePhoneNumberController = useTextEditingController();
    final addressController = useTextEditingController();
    final identityController = useTextEditingController();
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
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
                        UserInformation.personal,
                        controller,
                        false,
                        'Cheers almost there fill in your',
                        'next of kin details.',
                        'Fill Next of Kin details',
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
                      const CustomAppBarWithBackButton(
                        text: 'Personal information',
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                AppSpacing.setVerticalSpace(25),
                                CustomInputField(
                                  label: 'Phone number',
                                  hintText: '08022222222',
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  validator: context.validatePhoneNumber,
                                  maxLength: 11,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Phone number 2',
                                  hintText: '08011111111',
                                  keyboardType: TextInputType.phone,
                                  controller: alternativePhoneNumberController,
                                  maxLength: 11,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomDropDownButton(
                                  label: 'Gender',
                                  texts: Gender.values
                                      .map((e) => e.name.capitalizeFirst)
                                      .toList(),
                                  value: selectedGender.value,
                                  onChanged: (value) =>
                                      selectedGender.value = value,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomDropDownButton(
                                  label: 'State',
                                  hintText: 'Select state',
                                  texts: appState.states
                                      .map((e) => e.name ?? '')
                                      .toList(),
                                  value: selectedStates.value,
                                  onChanged: (value) =>
                                      selectedStates.value = value,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Address',
                                  hintText:
                                      '23 finance quatres, Kublai , Abuja.',
                                  keyboardType: TextInputType.streetAddress,
                                  validator: context.validateFieldNotEmpty,
                                  controller: addressController,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                DatePickerFormCard(
                                  label: 'Date of birth',
                                  hintText: '23/06/1993',
                                  initialValue: dob.value == null
                                      ? null
                                      : DateFormat('dd/MM/yyyy')
                                          .format(dob.value!),
                                  onChanged: (value) => dob.value = value,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomDropDownButton(
                                  label: 'Marital status',
                                  texts: MaritalStatus.values
                                      .map(
                                        (e) => e.name.capitalizeFirst,
                                      )
                                      .toList(),
                                  value: selectedMaritalStatus.value,
                                  onChanged: (value) {
                                    if (value == 'Married') {
                                      isMarried.value = true;
                                    }
                                    selectedMaritalStatus.value = value;
                                  },
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomDropDownButton(
                                  label: 'Identification',
                                  texts: IdentificationMeans.values
                                      .map(
                                        (e) => e.name
                                            .replaceAll('_', ' ')
                                            .capitalizeFirst,
                                      )
                                      .toList(),
                                  value: selectedIdentification.value,
                                  onChanged: (value) {
                                    selectedIdentification.value = value;
                                  },
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Identity number',
                                  hintText: '12345678909876543',
                                  validator: context.validateFieldNotEmpty,
                                  controller: identityController,
                                ),
                                AppSpacing.setVerticalSpace(40),
                                Button(
                                  enable: !(selectedGender.value == null ||
                                        dob.value == null ||
                                        selectedMaritalStatus.value == null ||
                                        selectedIdentification.value == null ||
                                        selectedStates.value == null),
                                  isBusy: state.viewState.isProcessing,
                                  onPressed: () {
                                    
                                    if (formKey.currentState!.validate()) {
                                      final personalDetailsParam =
                                          UpdatePersonalDetailsParam(
                                        stateId: appState.states
                                            .firstWhere(
                                              (element) =>
                                                  element.name ==
                                                  selectedStates.value,
                                              orElse: () =>
                                                  const StateResponse(id: 1),
                                            )
                                            .id
                                            .toString(),
                                        alternativePhoneNumber:
                                            alternativePhoneNumberController
                                                .text,
                                        dateOfBirth:
                                            dob.value!.toIso8601String(),
                                        gender: selectedGender.value,
                                        maritalStatus: selectedMaritalStatus
                                            .value
                                            ?.toLowerCase(),
                                        modeOfIdentification:
                                            selectedIdentification.value
                                                ?.replaceAll(' ', '_')
                                                .toLowerCase(),
                                        modeOfIdentificationNumber:
                                            identityController.text,
                                        phoneNumber: phoneController.text,
                                        residentialAddress:
                                            addressController.text,
                                      );

                                      if (selectedMaritalStatus.value !=
                                          'Married') {
                                        context.read<AuthenticationBloc>().add(
                                              AuthenticationEvent
                                                  .updatePersonalInfo(
                                                param: personalDetailsParam,
                                              ),
                                            );
                                      } else {
                                        personalDetails?.value =
                                            personalDetailsParam;
                                        showInfoCustomModel(
                                          context,
                                          UserInformation.personal,
                                          controller,
                                          false,
                                          'Cheers almost there fill in your',
                                          'spouse details.',
                                          'Fill spouse details',
                                        );
                                      }
                                    }
                                  },
                                  text: 'Save changes',
                                ),
                                AppSpacing.setVerticalSpace(25),
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
      },
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/app/bloc/app_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_guarantor/add_guarantor_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/services/file_picker_service.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:intl/intl.dart';

class GuarantorPage extends HookWidget {
  const GuarantorPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  static const routeName = 'guarantor';

  final bool isAfterLogin;
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final callCount = useState(0);
    final fistNameControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final middleNameControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final lastNameControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final phoneNumberControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final emailControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final addressControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final relationships = [
      useState<String?>(null),
      useState<String?>(null),
    ];

    final annualSalaryController = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final city = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final dateOFBirth = [
      useState<DateTime?>(null),
      useState<DateTime?>(null),
    ];
    final employeeAddress = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final employeeName = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final expireDate = [
      useState<DateTime?>(null),
      useState<DateTime?>(null),
    ];
    final identificationNumber = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final issueDateController = [
      useState<DateTime?>(null),
      useState<DateTime?>(null),
    ];
    final occupationController = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final positionHeldController = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final maritalStatus = [
      useState<String?>(null),
      useState<String?>(null),
    ];
    final meanOfIdentification = [
      useState<String?>(null),
      useState<String?>(null),
    ];
    final selectedState = [
      useState<String?>(null),
      useState<String?>(null),
    ];
    final photo = [
      useState<File?>(null),
      useState<File?>(null),
    ];
    return BlocProvider(
      create: (context) => locator<AuthenticationBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, appState) {
          return Scaffold(
            appBar: const EmptyAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                buildWhen: (previous, current) {
                  if (previous.viewState.isProcessing &&
                      current.viewState.isSuccess) {
                    if (callCount.value == 1) {
                      if (isAfterLogin) {
                        showInfoCustomModel(
                          context,
                          UserInformation.guarantor,
                          controller,
                        );
                      } else {
                        context.navigator.pop();
                      }
                    } else {
                      callCount.value = callCount.value + 1;
                      context.read<AuthenticationBloc>().add(
                            AuthenticationEvent.addGuarantor(
                              (
                                AddGuarantorParam(
                                  address: addressControllers.last.text,
                                  emailAddress: emailControllers.last.text,
                                  middleName: middleNameControllers.last.text,
                                  phoneNumber: phoneNumberControllers.last.text,
                                  relationship: relationships.last.value
                                      ?.replaceAll('_', '-')
                                      .toLowerCase(),
                                  annualSalary:
                                      annualSalaryController.last.text,
                                  city: city.last.text,
                                  dateOFBirth:
                                      dateOFBirth.last.value?.toIso8601String(),
                                  employeeAddress: employeeAddress.last.text,
                                  employeeName: employeeName.last.text,
                                  expireDate:
                                      expireDate.last.value?.toIso8601String(),
                                  firstname: fistNameControllers.last.text,
                                  identificationNumber:
                                      identificationNumber.last.text,
                                  issueDate: issueDateController.last.value
                                      ?.toIso8601String(),
                                  lastname: lastNameControllers.last.text,
                                  maritalStatus:
                                      maritalStatus.last.value?.toLowerCase(),
                                  meanOfIdentification: meanOfIdentification
                                      .last.value
                                      ?.replaceAll(' ', '_')
                                      .toLowerCase(),
                                  occupation: occupationController.last.text,
                                  positionHeld:
                                      positionHeldController.last.text,
                                  stateId: appState.states
                                      .lastWhere(
                                        (element) =>
                                            element.name ==
                                            selectedState.last.value,
                                        orElse: () => const StateResponse(
                                          id: 1,
                                        ),
                                      )
                                      .id
                                      .toString(),
                                ),
                                photo.last.value!
                              ),
                            ),
                          );
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
                        text: 'Guarantor',
                        onNavigateBack: controller == null
                            ? null
                            : () => UserInformation.guarantor
                                .navigateBack(controller!),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSpacing.setVerticalSpace(25),
                                Text(
                                  'Guarantor 1',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 16.fontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                AppSpacing.setVerticalSpace(12),
                                GuarantorForm(
                                  fistNameController: fistNameControllers[0],
                                  lastNameController: lastNameControllers[0],
                                  phoneNumberController:
                                      phoneNumberControllers[0],
                                  emailController: emailControllers[0],
                                  addressController: addressControllers[0],
                                  relationship: relationships[0],
                                  middleNameController:
                                      middleNameControllers.first,
                                  annualSalaryController:
                                      annualSalaryController.first,
                                  city: city.first,
                                  dateOFBirth: dateOFBirth.first,
                                  employeeAddress: employeeAddress.first,
                                  employeeName: employeeName.first,
                                  expireDate: expireDate.first,
                                  identificationNumber:
                                      identificationNumber.first,
                                  issueDate: issueDateController.first,
                                  maritalStatus: maritalStatus.first,
                                  meanOfIdentificationController:
                                      meanOfIdentification.first,
                                  occupationController:
                                      occupationController.first,
                                  photo: photo.first,
                                  positionHeldController:
                                      positionHeldController.first,
                                  selectedState: selectedState.first,
                                ),
                                AppSpacing.setVerticalSpace(24),
                                Text(
                                  'Guarantor 2',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 16.fontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                AppSpacing.setVerticalSpace(12),
                                GuarantorForm(
                                  fistNameController: fistNameControllers[1],
                                  lastNameController: lastNameControllers[1],
                                  phoneNumberController:
                                      phoneNumberControllers[1],
                                  emailController: emailControllers[1],
                                  addressController: addressControllers[1],
                                  relationship: relationships[1],
                                  middleNameController:
                                      middleNameControllers.last,
                                  annualSalaryController:
                                      annualSalaryController.last,
                                  city: city.last,
                                  dateOFBirth: dateOFBirth.last,
                                  employeeAddress: employeeAddress.last,
                                  employeeName: employeeName.last,
                                  expireDate: expireDate.last,
                                  identificationNumber:
                                      identificationNumber.last,
                                  issueDate: issueDateController.last,
                                  maritalStatus: maritalStatus.last,
                                  meanOfIdentificationController:
                                      meanOfIdentification.last,
                                  occupationController:
                                      occupationController.last,
                                  photo: photo.last,
                                  positionHeldController:
                                      positionHeldController.last,
                                  selectedState: selectedState.last,
                                ),
                                AppSpacing.setVerticalSpace(40),
                                BlocBuilder<AppBloc, AppState>(
                                  builder: (context, appState) {
                                    return Button(
                                      enable: (photo.first.value != null &&
                                              photo.last.value != null) &&
                                          (selectedState.first.value != null &&
                                              selectedState.last.value !=
                                                  null) &&
                                          (dateOFBirth.first.value != null &&
                                              dateOFBirth.last.value != null) &&
                                          (maritalStatus.first.value != null &&
                                              maritalStatus.last.value !=
                                                  null) &&
                                          (relationships.first.value != null &&
                                              relationships.last.value !=
                                                  null) &&
                                          (meanOfIdentification.first.value !=
                                                  null &&
                                              meanOfIdentification.last.value !=
                                                  null) &&
                                          (issueDateController.first.value !=
                                                  null &&
                                              issueDateController.last.value !=
                                                  null) &&
                                          (expireDate.first.value != null &&
                                              expireDate.last.value != null),
                                      isBusy: state.viewState.isProcessing,
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<AuthenticationBloc>()
                                              .add(
                                                AuthenticationEvent
                                                    .addGuarantor(
                                                  (AddGuarantorParam(
                                                    address: addressControllers
                                                        .first.text,
                                                    emailAddress:
                                                        emailControllers
                                                            .first.text,
                                                    middleName:
                                                        middleNameControllers
                                                            .first.text,
                                                    phoneNumber:
                                                        phoneNumberControllers
                                                            .first.text,
                                                    relationship: relationships
                                                        .first.value
                                                        ?.replaceAll('_', '-')
                                                        .toLowerCase(),
                                                    annualSalary:
                                                        annualSalaryController
                                                            .first.text,
                                                    city: city.first.text,
                                                    dateOFBirth: dateOFBirth
                                                        .first.value
                                                        ?.toIso8601String(),
                                                    employeeAddress:
                                                        employeeAddress
                                                            .first.text,
                                                    employeeName:
                                                        employeeName.first.text,
                                                    expireDate: expireDate
                                                        .first.value
                                                        ?.toIso8601String(),
                                                    firstname:
                                                        fistNameControllers
                                                            .first.text,
                                                    identificationNumber:
                                                        identificationNumber
                                                            .first.text,
                                                    issueDate:
                                                        issueDateController
                                                            .first.value
                                                            ?.toIso8601String(),
                                                    lastname:
                                                        lastNameControllers
                                                            .first.text,
                                                    maritalStatus: maritalStatus
                                                        .first.value
                                                        ?.toLowerCase(),
                                                    meanOfIdentification:
                                                        meanOfIdentification
                                                            .first.value
                                                            ?.replaceAll(
                                                              ' ',
                                                              '_',
                                                            )
                                                            .toLowerCase(),
                                                    occupation:
                                                        occupationController
                                                            .first.text,
                                                    positionHeld:
                                                        positionHeldController
                                                            .first.text,
                                                    stateId: appState.states
                                                        .firstWhere(
                                                          (element) =>
                                                              element.name ==
                                                              selectedState
                                                                  .first.value,
                                                          orElse: () =>
                                                              const StateResponse(
                                                            id: 1,
                                                          ),
                                                        )
                                                        .id
                                                        .toString(),
                                                  ), photo.first.value!),
                                                ),
                                              );
                                        }
                                      },
                                      text: 'Add Guarantor',
                                    );
                                  },
                                ),
                                AppSpacing.setVerticalSpace(20),
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
          );
        },
      ),
    );
  }
}

class GuarantorForm extends StatelessWidget {
  const GuarantorForm({
    super.key,
    required this.fistNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.addressController,
    required this.relationship,
    required this.middleNameController,
    required this.annualSalaryController,
    required this.city,
    required this.dateOFBirth,
    required this.employeeAddress,
    required this.employeeName,
    required this.expireDate,
    required this.identificationNumber,
    required this.issueDate,
    required this.maritalStatus,
    required this.meanOfIdentificationController,
    required this.occupationController,
    required this.photo,
    required this.positionHeldController,
    required this.selectedState,
  });

  final TextEditingController fistNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final ValueNotifier<String?> relationship;
  final TextEditingController annualSalaryController;
  final TextEditingController city;
  final ValueNotifier<DateTime?> dateOFBirth;
  final TextEditingController employeeAddress;
  final TextEditingController employeeName;
  final ValueNotifier<DateTime?> expireDate;
  final TextEditingController identificationNumber;
  final ValueNotifier<DateTime?> issueDate;
  final ValueNotifier<String?> maritalStatus;
  final ValueNotifier<String?> meanOfIdentificationController;
  final TextEditingController occupationController;
  final ValueNotifier<File?> photo;
  final TextEditingController positionHeldController;
  final ValueNotifier<String?> selectedState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInputField(
              label: 'First name',
              hintText: 'Tobi',
              controller: fistNameController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Middle name',
              hintText: 'dan',
              controller: middleNameController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Last name',
              hintText: 'Hassan',
              controller: lastNameController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Phone number',
              hintText: '012012656758675',
              keyboardType: TextInputType.phone,
              maxLength: 11,
              controller: phoneNumberController,
              validator: context.validatePhoneNumber,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'City',
              hintText: 'Ikeja',
              keyboardType: TextInputType.streetAddress,
              controller: city,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomDropDownButton(
              label: 'State',
              hintText: 'Select state',
              texts: appState.states.map((e) => e.name ?? '').toList(),
              value: selectedState.value,
              onChanged: (value) => selectedState.value = value,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Address',
              hintText: 'Somewhere on earth, Lagos.',
              keyboardType: TextInputType.streetAddress,
              controller: addressController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Email Address',
              hintText: 'example@example.com',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: context.validateEmailAddress,
            ),
            AppSpacing.setVerticalSpace(12),
            DatePickerFormCard(
              label: 'Date of birth',
              hintText: '23/06/1993',
              initialValue: dateOFBirth.value == null
                  ? null
                  : DateFormat('dd/MM/yyyy').format(dateOFBirth.value!),
              onChanged: (value) => dateOFBirth.value = value,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomDropDownButton(
              label: 'Marital status',
              texts: MaritalStatus.values
                  .map(
                    (e) => e.name.capitalizeFirst,
                  )
                  .toList(),
              value: maritalStatus.value,
              onChanged: (value) {
                maritalStatus.value = value;
              },
            ),
            AppSpacing.setVerticalSpace(12),
            CustomDropDownButton(
              label: 'Relationship with guarantor',
              texts: RelationShip.values
                  .map((e) => e.name.capitalizeFirst)
                  .toList(),
              value: relationship.value,
              onChanged: (value) => relationship.value = value,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomDropDownButton(
              label: 'Identification',
              texts: IdentificationMeans.values
                  .map((e) => e.name.replaceAll('_', ' ').capitalizeFirst)
                  .toList(),
              value: meanOfIdentificationController.value,
              onChanged: (value) {
                meanOfIdentificationController.value = value;
              },
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Identity number',
              hintText: '12345678909876543',
              validator: context.validateFieldNotEmpty,
              controller: identificationNumber,
            ),
            AppSpacing.setVerticalSpace(12),
            DatePickerFormCard(
              label: 'Identification Issue date',
              hintText: '23/06/1993',
              initialValue: issueDate.value == null
                  ? null
                  : DateFormat('dd/MM/yyyy').format(issueDate.value!),
              onChanged: (value) => issueDate.value = value,
            ),
            AppSpacing.setVerticalSpace(12),
            DatePickerFormCard(
              label: 'Identification Expiry date',
              hintText: '23/06/1993',
              initialValue: expireDate.value == null
                  ? null
                  : DateFormat('dd/MM/yyyy').format(expireDate.value!),
              onChanged: (value) => expireDate.value = value,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Employee Name',
              hintText: 'Enter employee name',
              controller: employeeName,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Occupation',
              hintText: 'Enter occupation',
              controller: occupationController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Position Held',
              hintText: 'Enter position',
              controller: positionHeldController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Employee Address',
              hintText: 'Enter an address',
              controller: employeeAddress,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            CustomInputField(
              label: 'Annual Salary',
              hintText: '10000',
              keyboardType: TextInputType.number,
              controller: annualSalaryController,
              validator: context.validateFieldNotEmpty,
            ),
            AppSpacing.setVerticalSpace(12),
            Text(
              'Guarantor Photo',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSpacing.verticalSpaceTiny,
            GestureDetector(
              onTap: () async {
                if (photo.value == null) {
                  final image = await FilePickerService().pickImage();
                  if (image == null) return;
                  photo.value = File(image);
                }
              },
              child: Container(
                height: 120.height,
                width: double.infinity,
                padding: EdgeInsets.all(16.radius),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.radius),
                  border: Border.all(
                    color: const Color(0xFFC1CDDA),
                  ),
                  image: photo.value == null
                      ? null
                      : DecorationImage(
                          image: FileImage(photo.value!),
                        ),
                ),
                child: photo.value == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.photo_album_rounded,
                            color: AppColors.primaryColor,
                          ),
                          AppSpacing.verticalSpaceSmall,
                          Text(
                            'Select an image',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    : Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => photo.value = null,
                          child: const Icon(
                            Icons.close_rounded,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}

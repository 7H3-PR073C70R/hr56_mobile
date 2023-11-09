import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_emergency_contact/add_emergency_contact_param.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class EmergencyContactPage extends HookWidget {
  const EmergencyContactPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  static const routeName = 'emergency-contact';

  final bool isAfterLogin;
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final fistNameControllers = [
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
    return BlocProvider(
      create: (context) => locator<AuthenticationBloc>(),
      child: Scaffold(
        appBar: const EmptyAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBarWithBackButton(
                onNavigateBack: controller == null
                    ? null
                    : () => UserInformation.emergency.navigateBack(controller!),
                text: 'Emergency contact',
              ),
              Expanded(
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  buildWhen: (previous, current) {
                    if (previous.viewState.isProcessing &&
                        current.viewState.isSuccess) {
                      if (isAfterLogin) {
                        showInfoCustomModel(
                          context,
                          UserInformation.emergency,
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
                    return SingleChildScrollView(
                      child: Form(
                         key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.setVerticalSpace(25),
                            Text(
                              'Emergency Contact  1',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(12),
                            EmergencyContactForm(
                              fistNameController: fistNameControllers[0],
                              lastNameController: lastNameControllers[0],
                              phoneNumberController: phoneNumberControllers[0],
                              emailController: emailControllers[0],
                              addressController: addressControllers[0],
                              relationship: relationships[0],
                            ),
                            AppSpacing.setVerticalSpace(24),
                            Text(
                              'Emergency Contact  2',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(12),
                            EmergencyContactForm(
                              fistNameController: fistNameControllers[1],
                              lastNameController: lastNameControllers[1],
                              phoneNumberController: phoneNumberControllers[1],
                              emailController: emailControllers[1],
                              addressController: addressControllers[1],
                              relationship: relationships[1],
                            ),
                            AppSpacing.setVerticalSpace(40),
                            Button(
                              isBusy: state.viewState.isProcessing,
                              onPressed: () {
                                 if (formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.addEmergencyContact(
                                          AddEmergencyContactParam(
                                            address:
                                                addressControllers.first.text,
                                            emailAddress:
                                                emailControllers.first.text,
                                            firstName:
                                                fistNameControllers.first.text,
                                            lastName:
                                                lastNameControllers.first.text,
                                            middleName: 'name',
                                            phoneNumber: phoneNumberControllers
                                                .first.text,
                                            relationship: relationships
                                                .first.value
                                                ?.replaceAll('_', '-')
                                                .toLowerCase(),
                                            secondAddress:
                                                addressControllers.last.text,
                                            secondEmailAddress:
                                                emailControllers.last.text,
                                            secondFirstName:
                                                fistNameControllers.last.text,
                                            secondLastName:
                                                lastNameControllers.last.text,
                                            secondMiddleName: 'name',
                                            secondPhoneNumber:
                                                phoneNumberControllers
                                                    .last.text,
                                            secondRelationship: relationships
                                                .last.value
                                                ?.replaceAll('_', '-')
                                                .toLowerCase(),
                                          ),
                                        ),
                                      );
                                }
                              },
                              text: 'Add Contact',
                            ),
                            AppSpacing.setVerticalSpace(20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyContactForm extends StatelessWidget {
  const EmergencyContactForm({
    super.key,
    required this.fistNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.addressController,
    required this.relationship,
  });

  final TextEditingController fistNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final ValueNotifier<String?> relationship;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputField(
          label: 'First name',
          hintText: 'Tobi',
          controller: fistNameController,
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
        CustomDropDownButton(
          label: 'Relationship with contact',
          texts:
              RelationShip.values.map((e) => e.name.capitalizeFirst).toList(),
          value: relationship.value,
          onChanged: (value) => relationship.value = value,
        ),
      ],
    );
  }
}

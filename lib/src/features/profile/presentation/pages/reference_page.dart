import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_reference/add_reference_param.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class ReferencePage extends HookWidget {
  const ReferencePage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  final bool isAfterLogin;
  final PageController? controller;

  static const routeName = 'reference';
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final address = useTextEditingController();
    final companyName = useTextEditingController();
    final department = useTextEditingController();
    final fullName = useTextEditingController();
    final jobRole = useTextEditingController();
    final phoneNumber = useTextEditingController();
    final email = useTextEditingController();
    final relationship = useState<String?>(null);
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
                    UserInformation.reference,
                    controller,
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
                    text: 'Reference',
                    onNavigateBack: controller == null
                        ? null
                        : () =>
                            UserInformation.reference.navigateBack(controller!),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppSpacing.setVerticalSpace(25),
                            CustomInputField(
                              label: 'Name',
                              hintText: 'Tobi',
                              controller: fullName,
                              validator: context.validateFullName,
                            ),
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Email',
                              hintText: 'hassan@hassan.com',
                              keyboardType: TextInputType.emailAddress,
                              controller: email,
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
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Address',
                              hintText: 'Somewhere on earth, Lagos.',
                              keyboardType: TextInputType.streetAddress,
                              controller: address,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Phone number',
                              hintText: '0909656758675',
                              maxLength: 11,
                              keyboardType: TextInputType.phone,
                              controller: phoneNumber,
                              validator: context.validatePhoneNumber,
                            ),
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Job role',
                              controller: jobRole,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Company name',
                              controller: companyName,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(9),
                            CustomInputField(
                              label: 'Job department',
                              controller: department,
                              validator: context.validateFieldNotEmpty,
                            ),
                            AppSpacing.setVerticalSpace(40),
                            Button(
                              isBusy: state.viewState.isProcessing,
                              enable: relationship.value != null,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.addReference(
                                          AddReferenceParam(
                                            address: address.text,
                                            companyName: companyName.text,
                                            department: department.text,
                                            emailAddress: email.text,
                                            fullName: fullName.text,
                                            jobRole: jobRole.text,
                                            phoneNumber: phoneNumber.text,
                                            relationship: relationship.value
                                                ?.replaceAll('_', '-')
                                                .toLowerCase(),
                                          ),
                                        ),
                                      );
                                }
                              },
                              text: 'Add Reference',
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
      ),
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/app/bloc/app_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart' as enums;
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/show_custom_modal.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_bank_details/add_bank_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/bank/bank.dart';
import 'package:hr56_staff/src/features/auth/data/models/pension_admin/pension_admin.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class BankDetailsPage extends HookWidget {
  const BankDetailsPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  final bool isAfterLogin;
  final PageController? controller;

  static const routeName = 'bank-details';
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final accountName = useTextEditingController();
    final accountNumber = useTextEditingController();
    final groupLifeAmount = useTextEditingController();
    final nin = useTextEditingController();
    final selectedPensionAdmin = useState<String?>(null);
    final pensionRsaNumber = useTextEditingController();
    final selectedBank = useState<String?>(null);
    return BlocProvider<AuthenticationBloc>(
      create: (context) => locator<AuthenticationBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, appState) {
          return Scaffold(
            appBar: const EmptyAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomAppBarWithBackButton(
                    text: 'Bank details',
                    onNavigateBack: controller == null
                        ? null
                        : () => enums.UserInformation.bank
                            .navigateBack(controller!),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child:
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        buildWhen: (previous, current) {
                          if (previous.viewState.isProcessing &&
                              current.viewState.isSuccess) {
                            if (isAfterLogin) {
                              showInfoCustomModel(
                                context,
                                enums.UserInformation.bank,
                                controller,
                              );
                            } else {
                              context.navigator.pop();
                            }
                          } else if (previous.viewState.isProcessing &&
                              current.viewState.isError) {
                            context.showErrorSnackBar(
                              message: current.errorMessage ??
                                  'Something went wrong',
                            );
                          }
                          return true;
                        },
                        builder: (context, state) {
                          return Form(
                            key: formKey,
                            child: Column(
                              children: [
                                AppSpacing.setVerticalSpace(25),
                                CustomDropDownButton(
                                  label: 'Bank name',
                                  hintText: 'Select bank',
                                  value: selectedBank.value,
                                  texts: appState.banks
                                      .map(
                                        (e) =>
                                            e.bankName?.capitalizeFirst ?? '',
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    selectedBank.value = value;
                                    selectedPensionAdmin.value = null;
                                  },
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Account name',
                                  hintText: 'Tobi Hassan',
                                  keyboardType: TextInputType.name,
                                  controller: accountName,
                                  validator: context.validateFieldNotEmpty,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Bank account number',
                                  hintText: '0126888787',
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: accountNumber,
                                  validator: context.validateFieldNotEmpty,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Group life amount',
                                  hintText: '100',
                                  controller: groupLifeAmount,
                                  keyboardType: TextInputType.number,
                                  validator: context.validateFieldNotEmpty,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomDropDownButton(
                                  label: 'Pension Admin Offer',
                                  hintText: 'Select pension admin offer',
                                  value: selectedBank.value,
                                  texts: appState.pensionAdmins
                                      // .where(
                                      //   (element) =>
                                      //       element.bank?.toLowerCase() ==
                                      //       selectedBank.value?.toLowerCase(),
                                      // )
                                      .map(
                                        (e) =>
                                            e.pensionAdminName
                                                ?.capitalizeFirst ??
                                            '',
                                      )
                                      .toList(),
                                  onChanged: (value) =>
                                      selectedPensionAdmin.value = value,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'Pension RSA Number',
                                  hintText: '019293939',
                                  controller: pensionRsaNumber,
                                  keyboardType: TextInputType.number,
                                  validator: context.validateFieldNotEmpty,
                                ),
                                AppSpacing.setVerticalSpace(12),
                                CustomInputField(
                                  label: 'NIN',
                                  hintText: '019293939',
                                  controller: nin,
                                  maxLength: 11,
                                  keyboardType: TextInputType.number,
                                  validator: context.validateFieldNotEmpty,
                                ),
                                AppSpacing.setVerticalSpace(40),
                                Button(
                                  isBusy: state.viewState.isProcessing,
                                  enable: selectedBank.value != null &&
                                      selectedPensionAdmin.value != null,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthenticationBloc>().add(
                                            AuthenticationEvent.addBankDetails(
                                              AddBankDetailsParam(
                                                accountName: accountName.text,
                                                accountNumber:
                                                    accountNumber.text,
                                                bankId: appState.banks
                                                        .firstWhere(
                                                          (element) =>
                                                              element
                                                                  .bankName ==
                                                              selectedBank
                                                                  .value,
                                                          orElse: () =>
                                                              const Bank(
                                                            bankId: 1,
                                                          ),
                                                        )
                                                        .bankId
                                                        ?.toInt() ??
                                                    1,
                                                groupLifeAmount: int.tryParse(
                                                      groupLifeAmount.text,
                                                    ) ??
                                                    0,
                                                nin: nin.text,
                                                pensionFundAdminId:
                                                    appState.pensionAdmins
                                                            .firstWhere(
                                                              (element) =>
                                                                  element
                                                                      .pensionAdminName ==
                                                                  selectedPensionAdmin
                                                                      .value,
                                                              orElse: () =>
                                                                  const PensionAdmin(
                                                                pensionFundAdminId:
                                                                    1,
                                                              ),
                                                            )
                                                            .pensionFundAdminId
                                                            ?.toInt() ??
                                                        1,
                                                pensionRsaNumber:
                                                    pensionRsaNumber.text,
                                              ),
                                            ),
                                          );
                                    }
                                  },
                                  text: 'Save changes',
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

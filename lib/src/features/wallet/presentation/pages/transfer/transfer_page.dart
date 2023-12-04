// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/core/utils/input_formatter.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/beneficiary_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class TransferPage extends HookWidget {
  const TransferPage({super.key});

  static const routeName = 'transfer';

  @override
  Widget build(BuildContext context) {
    final selectedBank = useState<WalletBank?>(null);
    final accountNumber = useTextEditingController();
    final amountController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    accountNumber.addListener(() {
      if (selectedBank.value != null && accountNumber.text.length == 10) {
        context.read<WalletBloc>().add(
              WalletEvent.accountLookup(
                LookupAccountParam(
                  account: accountNumber.text,
                  type: 'Bank',
                  bankCode: selectedBank.value!.code ?? '',
                ),
              ),
            );
      }
    });

    selectedBank.addListener(() {
      if (selectedBank.value != null && accountNumber.text.length == 10) {
        context.read<WalletBloc>().add(
              WalletEvent.accountLookup(
                LookupAccountParam(
                  account: accountNumber.text,
                  type: 'Bank',
                  bankCode: selectedBank.value!.code ?? '',
                ),
              ),
            );
      }
    });

    return Scaffold(
      appBar: const EmptyAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: BlocBuilder<WalletBloc, WalletState>(
          buildWhen: (previous, current) {
            if (current.viewState.isError) {
              context.showErrorSnackBar(
                message: current.errorMessage ??
                    'Something went wrong when fetching account details.',
              );
            }
            return true;
          },
          builder: (context, state) {
            final amount = double.tryParse(
                  state.walletInfo?.availableBalance ?? '',
                ) ??
                0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBarWithBackButton(
                  text: 'Transfer',
                ),
                AppSpacing.setVerticalSpace(28.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Beneficiaries',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 18.fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2D2D2D),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.navigator.pushNamed(
                        BeneficiaryPage.routeName,
                      ),
                      child: Text(
                        'view all',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 14.fontSize,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF039847),
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.verticalSpaceMedium,
                SizedBox(
                  height: 85.height,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      children: [
                        CircleAvatar(
                          radius: 26.5.radius,
                          backgroundColor: AppColors.greyColor,
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 40.height,
                            ),
                          ),
                        ),
                        AppSpacing.setVerticalSpace(2),
                        Text(
                          AppStrings.nameList[index].replaceFirst(' ', '\n'),
                          textAlign: TextAlign.center,
                          style: context.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fontSize,
                            color: const Color(0xFF2D2D2D),
                          ),
                        ),
                      ],
                    ),
                    itemCount: AppStrings.nameList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        AppSpacing.horizontalSpaceMedium,
                  ),
                ),
                AppSpacing.setVerticalSpace(32),
                CustomDropDownButton(
                  texts: state.banks.map((e) => e.name ?? '').toList(),
                  hintText: 'Select bank',
                  label: 'Bank',
                  value: selectedBank.value?.name,
                  isSearchable: true,
                  onChanged: (value) {
                    selectedBank.value = state.banks
                        .firstWhere((element) => element.name == value);
                  },
                ),
                AppSpacing.setVerticalSpace(15),
                Column(
                  children: [
                    CustomInputField(
                      hintText: '0898675867586',
                      label: 'Account number',
                      keyboardType: TextInputType.number,
                      controller: accountNumber,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null) return 'Field cannot be empty';
                        if (value.isEmpty) return 'Field cannot be empty';
                        if (value.length != 10) {
                          return 'Invalid account number';
                        }
                        return null;
                      },
                    ),
                    AppSpacing.setVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 12.fontSize,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF039847),
                          ),
                        ),
                        Text(
                          'Balance: ${AppStrings.naira}${amount.toAmount}',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 12.fontSize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF96999B),
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.setVerticalSpace(6),
                    SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          controller: amountController,
                          inputFormatters: [AmountTextInputFormatter()],
                          validator: (value) {
                            if (value == null) return 'Field cannot be empty';
                            if (value.isEmpty) return 'Field cannot be empty';
                            if ((double.tryParse(value.replaceAll(',', '')) ??
                                    0) >
                                amount) {
                              return 'Amount cannot be greater than ${amount.toAmount}';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              AppAssetPath.ngn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.accountLookup != null) ...[
                  AppSpacing.setVerticalSpace(15),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10.radius,
                        backgroundColor: const Color(0xFF039847),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      AppSpacing.setHorizontalSpace(10),
                      Text(
                        state.accountLookup?.accountName ?? '',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.fontSize,
                          color: const Color(0xFF039847),
                        ),
                      ),
                    ],
                  ),
                ],
                AppSpacing.setVerticalSpace(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save as beneficiary',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 14.fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF505050),
                      ),
                    ),
                    CupertinoSwitch(
                      value: true,
                      onChanged: (_) {},
                      activeColor: const Color(0xFF0671E0),
                      thumbColor: AppColors.whiteColor,
                    ),
                  ],
                ),
                AppSpacing.setVerticalSpace(40),
                Button(
                  enable: state.accountLookup != null,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.navigator.push(
                        ReviewTransferDetailsRoute(
                          amount: amountController.text,
                        ),
                      );
                    }
                  },
                  text: 'Continue',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

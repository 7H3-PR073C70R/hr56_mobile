// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/enter_pin_modal.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class ElectricityPaymentPage extends HookWidget {
  const ElectricityPaymentPage({super.key});

  static const routeName = 'electricity-payments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: BlocBuilder<WalletBloc, WalletState>(
          bloc: context.read<WalletBloc>()
            ..add(
              const WalletEvent.getBillers('power'),
            ),
          buildWhen: (previous, current) {
            if (previous.paymentViewState.isProcessing &&
                current.paymentViewState.isError) {
              context.showErrorSnackBar(
                message: current.errorMessage ?? 'Electricity payment failed',
              );
            }
            if (previous.paymentViewState.isProcessing &&
                current.paymentViewState.isSuccess) {
              context.showSnackBar(
                message:
                    current.errorMessage ?? 'Electricity  payment successfully',
              );
            }
            if (previous.billerViewState.isProcessing &&
                current.billerViewState.isError) {
              context.showErrorSnackBar(
                message: current.errorMessage ?? 'Unable to get biller info',
              );
              Navigator.of(context).pop();
            }
            return true;
          },
          builder: (context, state) {
            return const _Body();
          },
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final meterNumber = useTextEditingController();
    final hasMeterNumber = useState(false);
    final selectedBiller = useState<Biller?>(null);
    meterNumber.addListener(() {
      hasMeterNumber.value = meterNumber.text.isNotEmpty;
    });
    final selectedPaymentItem = useState<String?>(null);

    final amountController = useTextEditingController();
    final selectedBillerIndex = useState(-1);
    return Column(
      children: [
        const CustomAppBarWithBackButton(text: 'Electricity'),
        AppSpacing.setVerticalSpace(37),
        _ElectricityBillerSelectorCard(
          selectedBiller: selectedBiller,
        ),
        AppSpacing.setVerticalSpace(16),
        CustomDropDownButton(
          label: 'Payment item',
          texts: const [
            'Prepaid',
            'Postpaid',
          ],
          hintText: 'Prepaid',
          value: selectedPaymentItem.value,
          onChanged: (value) => selectedPaymentItem.value = value,
        ),
        AppSpacing.setVerticalSpace(16),
        CustomInputField(
          label: 'Meter Number',
          controller: meterNumber,
          hintText: 'Enter Meter number',
          maxLength: 11,
        ),
        AppSpacing.setVerticalSpace(21),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          padding: EdgeInsets.all(12.radius),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.radius,
            ),
            border: Border.all(
              color: const Color(0xFFCCCCCC),
            ),
          ),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.width,
                  mainAxisSpacing: 8.height,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (_, index) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    selectedBillerIndex.value = index;

                    amountController.text = [
                      '50',
                      '100',
                      '200',
                      '500',
                      '1,000',
                      '2,000',
                    ].elementAt(index);
                  },
                  child: Container(
                    height: 56.height,
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.radius,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedBillerIndex.value == index
                            ? const Color(0xFFAD00D7)
                            : const Color(0xFFCCCCCC),
                      ),
                      color: selectedBillerIndex.value == index
                          ? const Color(0xFFAD00D7).withOpacity(.06)
                          : null,
                      borderRadius: BorderRadius.circular(
                        10.radius,
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'N',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 15.fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: [
                              '50',
                              '100',
                              '200',
                              '500',
                              '1,000',
                              '2,000',
                            ].elementAt(index),
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 24.fontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpacing.setVerticalSpace(21),
        CustomInputField(
          label: 'Enter amount',
          hintText: 'N 50- 50,000',
          controller: amountController,
        ),
        AppSpacing.setVerticalSpace(41),
        BlocBuilder<WalletBloc, WalletState>(
          buildWhen: (previous, current) {
            if (previous.detailsViewState.isProcessing &&
                current.detailsViewState.isSuccess) {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                enableDrag: false,
                isDismissible: false,
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.radius),
                  ),
                ),
                builder: (_) => _MeterDetails(
                  address: '',
                  biller: selectedBiller.value ?? const Biller(),
                  meterNO: meterNumber.text,
                  paymentItem: selectedPaymentItem.value ?? '',
                  amount: amountController.text.replaceAll(',', ''),
                ),
              );
            } else if (previous.detailsViewState.isProcessing &&
                current.detailsViewState.isError) {
              context.showErrorSnackBar(
                message: current.errorMessage ??
                    'Invalid meeter number entered as'
                        ' details could not be found',
              );
            }
            return true;
          },
          builder: (context, state) {
            return Button(
              enable: hasMeterNumber.value &&
                  selectedBiller.value != null &&
                  selectedPaymentItem.value != null,
              isBusy: state.detailsViewState.isProcessing,
              onPressed: () {
                context.read<WalletBloc>().add(
                      WalletEvent.validateBillPayment(
                        ValidateBillPaymentUserParam(
                          billerId:
                              selectedBiller.value?.billerId?.toString() ?? '',
                          productId: '0',
                          customerNo: meterNumber.text,
                          serviceCategory: selectedPaymentItem.value ?? '',
                          serviceType: selectedPaymentItem.value ?? '',
                        ),
                      ),
                    );
              },
              text: 'Make payments',
              backgroundColor: AppColors.primaryColor,
            );
          },
        ),
      ],
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary({
    required this.biller,
    required this.paymentItem,
    required this.meterNO,
    required this.address,
    required this.amount,
  });

  final Biller biller;
  final String paymentItem;
  final String meterNO;
  final String address;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.setVerticalSpace(14),
            Stack(
              children: [
                Center(
                  child: Text(
                    'Payment',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 20.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.radius),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      behavior: HitTestBehavior.translucent,
                      child: CircleAvatar(
                        radius: 12.radius,
                        backgroundColor: AppColors.blackColor,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: 20.radius,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.setVerticalSpace(14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.radius),
              child: Column(
                children: [
                  Text(
                    'N ${double.tryParse(amount)?.toAmount ?? ''}',
                    style: context.textTheme.displayMedium?.copyWith(
                      fontSize: 32.fontSize,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFBB00E9),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(27),
                  Container(
                    padding: EdgeInsets.all(10.radius),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.radius),
                      border: Border.all(
                        color: const Color(0xFFCCCCCC),
                      ),
                    ),
                    child: Column(
                      children: [
                        (text: 'Biller Name:', value: biller.name ?? ''),
                        (text: 'Payment item:', value: paymentItem),
                        (text: 'Meter Number:', value: meterNO),
                        (
                          text: 'Meter Name:',
                          value:
                              state.billPaymentUser?.customerAccountName ?? '',
                        ),
                        (
                          text: 'Address:',
                          value: address,
                        ),
                      ]
                          .map(
                            (e) => Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        e.text,
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 14.fontSize,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF2B2B2B),
                                        ),
                                      ),
                                    ),
                                    AppSpacing.horizontalSpaceSmall,
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          e.value,
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 14.fontSize,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(
                                              0xFF2B2B2B,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AppSpacing.setVerticalSpace(16),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(23),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.radius,
                      vertical: 16.radius,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.radius),
                      color: const Color(0xFFF9F9F9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.walletInfo?.accountName ?? '',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 16.fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              AppSpacing.verticalSpaceTiny,
                              Text(
                                'From Wallet Balance',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 14.fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF555555),
                                ),
                              ),
                              AppSpacing.verticalSpaceTiny,
                              Text(
                                'N ${double.tryParse(state.walletInfo?.availableBalance ?? '')?.toAmount ?? ''}',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 14.fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF555555),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'N ${double.tryParse(amount)?.toAmount ?? ''}',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 20.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.setVerticalSpace(35),
                  BlocBuilder<WalletBloc, WalletState>(
                    buildWhen: (previous, current) {
                      if (current.paymentViewState.isIdle ||
                          current.paymentViewState.isProcessing) {
                        Navigator.of(context).pop();
                      }
                      return true;
                    },
                    builder: (context, state) {
                      return Button(
                        onPressed: () {
                          showModalBottomSheet<Widget>(
                            context: context,
                            barrierColor: const Color(0xFF070707).withOpacity(
                              .3,
                            ),
                            isScrollControlled: true,
                            backgroundColor: AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.radius),
                                topRight: Radius.circular(25.radius),
                              ),
                            ),
                            builder: (ctx) => EnterPinWithdrawModal(
                              onContinue: (value) => context
                                  .read<WalletBloc>()
                                  .add(
                                    WalletEvent.buyElectricity(
                                      BuyElectricityParam(
                                        amount: amount,
                                        billerName: biller.name ?? '',
                                        billerId:
                                            biller.billerId?.toString() ?? '',
                                        notificationPhone: '',
                                        customerAddress: address,
                                        customerName: state.billPaymentUser
                                                ?.customerAccountName ??
                                            '',
                                        customerNo: meterNO,
                                        notificationEmail:
                                            locator<UserStorageService>()
                                                    .user
                                                    ?.email ??
                                                '',
                                        serviceCategory: state.billPaymentUser
                                                ?.serviceCategory ??
                                            '',
                                        serviceType: state
                                                .billPaymentUser?.serviceType ??
                                            '',
                                        pin: value,
                                      ),
                                    ),
                                  ),
                            ),
                          );
                        },
                        isBusy: state.detailsViewState.isProcessing,
                        text: 'Confirm to pay',
                        backgroundColor: AppColors.primaryColor,
                      );
                    },
                  ),
                ],
              ),
            ),
            AppSpacing.setVerticalSpace(35),
          ],
        );
      },
    );
  }
}

class _MeterDetails extends StatelessWidget {
  const _MeterDetails({
    required this.biller,
    required this.paymentItem,
    required this.meterNO,
    required this.address,
    required this.amount,
  });
  final Biller biller;
  final String paymentItem;
  final String meterNO;
  final String address;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.setVerticalSpace(14),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 25.radius),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              behavior: HitTestBehavior.translucent,
              child: CircleAvatar(
                radius: 12.radius,
                backgroundColor: AppColors.blackColor,
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                    size: 20.radius,
                  ),
                ),
              ),
            ),
          ),
        ),
        AppSpacing.setVerticalSpace(14),
        BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.radius),
              child: Column(
                children: [
                  Text(
                    'Confirm Meter Details',
                    style: context.textTheme.displayMedium?.copyWith(
                      fontSize: 20.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(27),
                  ...[
                    (text: 'Biller Name:', value: biller.name ?? ''),
                    (text: 'Payment item:', value: paymentItem),
                    (text: 'Meter Number:', value: meterNO),
                    (
                      text: 'Meter Name:',
                      value: state.billPaymentUser?.customerAccountName ?? '',
                    ),
                    (
                      text: 'Address:',
                      value: address,
                    ),
                  ]
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.text,
                                    style: context.textTheme.displayLarge
                                        ?.copyWith(
                                      fontSize: 14.fontSize,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF2B2B2B),
                                    ),
                                  ),
                                ),
                                AppSpacing.horizontalSpaceSmall,
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      e.value,
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 14.fontSize,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(
                                          0xFF2B2B2B,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppSpacing.setVerticalSpace(16),
                          ],
                        ),
                      )
                      .toList(),
                  AppSpacing.setVerticalSpace(63),
                  Button(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showModalBottomSheet<dynamic>(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: false,
                        isDismissible: false,
                        backgroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.radius),
                          ),
                        ),
                        builder: (_) => _PaymentSummary(
                          address: address,
                          biller: biller,
                          meterNO: meterNO,
                          paymentItem: paymentItem,
                          amount: amount,
                        ),
                      );
                    },
                    text: 'Confirm to pay',
                    backgroundColor: AppColors.primaryColor,
                  ),
                  AppSpacing.setVerticalSpace(22),
                  Button(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Retry',
                    backgroundColor: AppColors.whiteColor,
                    textColor: AppColors.primaryColor,
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        AppSpacing.setVerticalSpace(35),
      ],
    );
  }
}

class _ElectricityBillerSelectorCard extends StatelessWidget {
  const _ElectricityBillerSelectorCard({
    required this.selectedBiller,
  });

  final ValueNotifier<Biller?> selectedBiller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.radius),
            ),
          ),
          builder: (_) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: AppSpacing.screenHeight(context) * .5,
              minWidth: double.infinity,
            ),
            child: _ElectricityBillerSelectorModal(
              selectedBiller: selectedBiller,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 8.radius,
          vertical: 7.radius,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.radius,
          ),
          border: Border.all(
            color: const Color(0xFFCCCCCC),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: selectedBiller.value == null
                  ? Text(
                      'Select a network provider',
                      style: context.theme.inputDecorationTheme.hintStyle,
                    )
                  : Row(
                      children: [
                        Image.network(
                          selectedBiller.value!.avatar ?? '',
                          height: 34.radius,
                          width: 34.radius,
                          errorBuilder: (context, error, stackTrace) =>
                              SvgImageAsset(
                            AppAssetPath.electricity,
                            width: 34.radius,
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          selectedBiller.value!.name ?? '',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
            ),
            AppSpacing.horizontalSpaceMedium,
            Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFF1E222B),
              size: 32.radius,
            ),
          ],
        ),
      ),
    );
  }
}

class _ElectricityBillerSelectorModal extends StatelessWidget {
  const _ElectricityBillerSelectorModal({
    required this.selectedBiller,
  });

  final ValueNotifier<Biller?> selectedBiller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.setVerticalSpace(16),
        Stack(
          children: [
            Center(
              child: Text(
                'Select Network Provider',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 20.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 25.radius),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  behavior: HitTestBehavior.translucent,
                  child: CircleAvatar(
                    radius: 12.radius,
                    backgroundColor: AppColors.primaryColor,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                        size: 20.radius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.setVerticalSpace(15),
        const Divider(
          height: 1,
          color: Color(0xFFCCCCCC),
        ),
        AppSpacing.setVerticalSpace(34),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.radius),
            child: BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      selectedBiller.value = state.billers[index];
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Image.network(
                          state.billers[index].avatar ?? '',
                          width: 46.radius,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.network(
                            state.billers[index].avatar ?? '',
                            width: 46.radius,
                            errorBuilder: (context, error, stackTrace) =>
                                SvgImageAsset(
                              AppAssetPath.electricity,
                              width: 46.radius,
                            ),
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          state.billers[index].name ?? '',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 20.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (_, index) =>
                      AppSpacing.setVerticalSpace(36),
                  itemCount: state.billers.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

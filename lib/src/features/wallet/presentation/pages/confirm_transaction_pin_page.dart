import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_transaction_pin/create_transaction_pin_param.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_pin_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class ConfirmTransactionPinPage extends HookWidget {
  const ConfirmTransactionPinPage({
    super.key,
    required this.pin,
  });

  static const routeName = 'confirm-transaction-pin';

  final String pin;

  @override
  Widget build(BuildContext context) {
    final confirmPIN = useState('');
    return Scaffold(
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarWithBackButton(text: 'Create transaction pin'),
            AppSpacing.setVerticalSpace(30),
            Text(
              'Confirm transaction pin',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 18.fontSize,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF039847),
              ),
            ),
            AppSpacing.setVerticalSpace(4),
            Text(
              'Create a Four (4) digits pin, to help secure your transactions.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 14.fontSize,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF505050),
              ),
            ),
            AppSpacing.setVerticalSpace(51),
            Text(
              'Re-enter  your PIN',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 16.fontSize,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E222B),
              ),
            ),
            AppSpacing.verticalSpaceTiny,
            Text(
              'Enter your 4-Digit PIN to confirm transaction',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 14.fontSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF808285),
              ),
            ),
            AppSpacing.setVerticalSpace(24),
            CustomPinField(
              onChanged: (value) {
                confirmPIN.value = value;
              },
            ),
            AppSpacing.setVerticalSpace(40),
            BlocBuilder<WalletBloc, WalletState>(
              buildWhen: (previous, current) {
                if (previous.viewState.isProcessing &&
                    current.viewState.isError) {
                  context.showErrorSnackBar(
                    message: current.errorMessage ?? 'Something went wrong',
                  );
                } else if (previous.viewState.isProcessing &&
                    current.viewState.isSuccess) {
                  context.showSnackBar(
                    message: 'Transaction PIN set successfully',
                  );
                  context.navigator.replaceAll(
                    const [
                      MainRoute(
                        children: [
                          WalletRoute(),
                        ],
                      ),
                    ],
                  );
                }
                return true;
              },
              builder: (context, state) {
                return Button(
                  isBusy: state.viewState.isProcessing,
                  enable: confirmPIN.value.length == 4,
                  onPressed: () => context.read<WalletBloc>().add(
                        WalletEvent.createTransactionPIN(
                          CreateTransactionPinParam(
                            pin: pin,
                            pinConfirmation: confirmPIN.value,
                          ),
                        ),
                      ),
                  text: 'Confirm',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

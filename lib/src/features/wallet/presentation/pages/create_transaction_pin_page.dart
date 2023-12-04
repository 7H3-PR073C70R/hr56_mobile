import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_pin_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class CreateTransactionPinPage extends HookWidget {
  const CreateTransactionPinPage({super.key});

  static const routeName = 'create-transaction-pin';

  @override
  Widget build(BuildContext context) {
    final pin = useState('');
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
              'Create transaction pin',
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
                pin.value = value;
              },
            ),
            AppSpacing.setVerticalSpace(40),
            Button(
              enable: pin.value.length == 4,
              onPressed: () => context.navigator.push(
                ConfirmTransactionPinRoute(
                  pin: pin.value,
                ),
              ),
              text: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }
}

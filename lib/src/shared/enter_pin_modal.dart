import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_pin_field.dart';

class EnterPinWithdrawModal extends HookWidget {
  const EnterPinWithdrawModal({
    super.key,
    required this.onContinue,
    this.titleTextColor,
  });

  final ValueChanged<String> onContinue;
  final Color? titleTextColor;

  @override
  Widget build(BuildContext context) {
    final pin = useState('');
    return Container(
      height: 637.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.setVerticalSpace(10),
          Center(
            child: Container(
              height: 7.9.height,
              width: 80.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.radius),
                color: const Color(0xFFE6E5E4),
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(32.1),
          Text(
            'Enter PIN',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 16.fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E222B),
            ),
          ),
          Text(
            'Enter your 4-Digit PIN to confirm transaction',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF808285),
            ),
          ),
          AppSpacing.verticalSpaceLarge,
          CustomPinField(
            onChanged: (value) {
              pin.value = value;
            },
          ),
          AppSpacing.setVerticalSpace(40),
          Button(
            enable: pin.value.length == 4,
            onPressed: () => onContinue(pin.value),
            text: 'Confirm',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinField extends StatelessWidget {
  const CustomPinField({
    super.key,
    required this.onChanged,
    this.controller,
    this.onCompleted,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      onChanged: onChanged,
      controller: controller,
      onCompleted: onCompleted,
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      obscureText: true,
      cursorColor: AppColors.blackColor.withOpacity(.5),
      mainAxisAlignment: MainAxisAlignment.start,
      autoFocus: true,
      pinTheme: PinTheme(
        borderRadius: BorderRadius.circular(8.radius),
        selectedColor: const Color(0xFFF4E5F8),
        fieldHeight: 46.radius,
        fieldWidth: 46.radius,
        borderWidth: 1.width,
        fieldOuterPadding: EdgeInsets.only(left: 32.radius),
        shape: PinCodeFieldShape.box,
        selectedFillColor: const Color(0xFFF4E5F8),
        activeColor: const Color(0xFF56006B),
        activeFillColor: const Color(0xFFF4E5F8),
        inactiveFillColor: const Color(0xFFF3F3F3),
        inactiveColor: const Color(0xFFF3F3F3),
        errorBorderColor: const Color(0xFFF3F3F3),
      ),
    );
  }
}

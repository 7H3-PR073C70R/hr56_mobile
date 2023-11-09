import 'package:flutter/material.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.label,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      isAuth: true,
      autovalidateMode: autovalidateMode,
      controller: controller,
      hintText: hintText,
      key: key,
      keyboardType: keyboardType,
      label: label,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
      validator: validator,
    );
  }
}

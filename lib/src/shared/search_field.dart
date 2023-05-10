import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.suffixIcon,
    required this.hint,
    this.controller,
    this.onChanged,
  });

  final Widget? suffixIcon;
  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.blackColor,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.radius),
          borderSide: BorderSide(
            width: 2.radius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.radius),
          borderSide: BorderSide(
            width: 2.radius,
          ),
        ),
      ),
    );
  }
}

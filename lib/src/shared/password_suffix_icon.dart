import 'package:flutter/material.dart';

class PasswordSuffixIcon extends StatelessWidget {
  const PasswordSuffixIcon({
    super.key,
    required this.obscure,
  });

  final ValueNotifier<bool> obscure;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => obscure.value = !obscure.value,
      icon: Icon(
        obscure.value ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}

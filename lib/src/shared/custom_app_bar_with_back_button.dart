import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({
    super.key,
    required this.text,
    this.leading,
  });

  final String text;
  final List<Widget>? leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppBackButton(),
        Expanded(
          child: Center(
            child: Text(
              text,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 20.fontSize,
              ),
            ),
          ),
        ),
        if (leading != null) ...leading!
      ],
    );
  }
}

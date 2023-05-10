import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({
    super.key,
    required this.text,
    this.showLeading = true,
    this.actions,
  });

  final String text;
  final bool showLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(showLeading)
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
        if (actions != null) ...actions!
      ],
    );
  }
}

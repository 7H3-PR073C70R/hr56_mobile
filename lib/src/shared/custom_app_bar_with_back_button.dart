import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({
    super.key,
    required this.text,
    this.showLeading = true,
    this.actions,
    this.onNavigateBack,
  });

  final String text;
  final bool showLeading;
  final List<Widget>? actions;
  final VoidCallback? onNavigateBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showLeading)
          AppBackButton(
            onPressed: onNavigateBack,
          ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 45.radius),
              child: Text(
                text,
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 20.fontSize,
                ),
              ),
            ),
          ),
        ),
        if (actions != null) ...actions!,
      ],
    );
  }
}

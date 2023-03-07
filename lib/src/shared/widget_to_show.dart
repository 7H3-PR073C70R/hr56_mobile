import 'package:flutter/material.dart';

class WidgetToShow extends StatelessWidget {
  const WidgetToShow({
    super.key,
    required this.isValidPassword,
    required this.child,
    this.secondChild,
  });

  final bool isValidPassword;
  final Widget child;
  final Widget? secondChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: child,
      secondChild: secondChild ?? const SizedBox.shrink(),
      crossFadeState: isValidPassword
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }
}

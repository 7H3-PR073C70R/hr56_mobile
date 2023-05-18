import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class SummaryText extends StatelessWidget {
  const SummaryText({
    super.key,
    required this.name,
    required this.title,
    this.titleColor,
  });

  final String name;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: context.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14.fontSize,
            color: const Color(0xFF737373),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: context.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12.fontSize,
            color: titleColor ?? const Color(0xFF2D2D2D),
          ),
        ),
      ],
    );
  }
}

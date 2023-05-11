import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    required this.isDebt,
    this.isFirst = true,
    this.isLast = false,
  });

  final String name;
  final String time;
  final String amount;
  final bool isDebt;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 10,
        bottom: 21,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EAF9).withOpacity(.2),
        border: Border(
          top: isFirst
              ? BorderSide(
                  color: const Color(0xFF824392).withOpacity(.1),
                )
              : BorderSide.none,
          bottom: isLast
              ? BorderSide(
                  color: const Color(0xFF824392).withOpacity(.1),
                )
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 14.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                Text(
                  time,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 12.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7A8189),
                  ),
                )
              ],
            ),
          ),
          Text(
            '${isDebt ? '-' : '+'} ${AppStrings.naira}$amount',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w500,
              color: isDebt ? const Color(0xFFEE2011) : const Color(0xFF03B655),
            ),
          ),
        ],
      ),
    );
  }
}

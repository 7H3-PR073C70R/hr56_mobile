import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class PayrollHistoryCard extends StatelessWidget {
  const PayrollHistoryCard({
    super.key,
    required this.amount,
    required this.date,
    required this.info,
  });

  final String amount;
  final String date;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          color: const Color(0xFFD3A2DF).withOpacity(.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    info,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 16.fontSize,
                    ),
                  ),
                  AppSpacing.verticalSpaceSmall,
                  Expanded(
                    child: Text(
                      '₦ $amount',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.verticalSpaceSmall,
              Text(
                date,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.fontSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2F343A),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.height,
          color: const Color(0xFFD3A2DF),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({
    super.key,
    required this.status,
    required this.amount,
    required this.date,
    required this.info,
  });

  final LoanStatus status;
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
                  Expanded(
                    child: Text(
                      '₦ $amount',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                      ),
                    ),
                  ),
                  Container(
                    height: 34.height,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.radius),
                      color: status.color,
                    ),
                    child: Text(
                      status.name.capitalizeFirst,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 15.fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.verticalSpaceSmall,
              Text(
                info,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 16.fontSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F848F),
                ),
              ),
              AppSpacing.verticalSpaceSmall,
              Text(
                date,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.fontSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F848F),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.height,
          color: const Color(0xFFD3A2DF),
        )
      ],
    );
  }
}

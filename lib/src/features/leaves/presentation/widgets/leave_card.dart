import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({
    super.key,
    required this.status,
    required this.title,
    required this.date,
    required this.reason,
    required this.approvalMessage,
  });

  final LeaveStatus status;
  final String title;
  final String date;
  final String reason;
  final String approvalMessage;

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
                      'Parental Leave',
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
                date,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 16.fontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AppSpacing.setVerticalSpace(12),
              RichText(
                text: TextSpan(
                  text: 'Reason: ',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 16.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: reason,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.setVerticalSpace(12),
              RichText(
                text: TextSpan(
                  text: 'Approval message: ',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 16.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: approvalMessage,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.type,
    required this.title,
    required this.date,
  });

  final NotificationType type;
  final String title;
  final String date;

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20.radius,
                backgroundColor: AppColors.backgroundColor.withOpacity(.3),
                child: const Center(
                  child: SvgImageAsset(AppAssetPath.loanSolid),
                ),
              ),
              AppSpacing.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        title,
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 16.fontSize,
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Row(
                      children: [
                        Text(
                          'Loan',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 13.fontSize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF484F5E),
                          ),
                        ),
                        AppSpacing.horizontalSpaceTiny,
                        CircleAvatar(
                          radius: 2.radius,
                          backgroundColor: const Color(0xFF8D8D8D),
                        ),
                        AppSpacing.horizontalSpaceTiny,
                        Text(
                          date,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 13.fontSize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF484F5E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
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

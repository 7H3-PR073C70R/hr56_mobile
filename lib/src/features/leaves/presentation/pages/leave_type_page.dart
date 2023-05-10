import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/request_leave_page.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LeaveTypePage extends StatelessWidget {
  const LeaveTypePage({super.key});

  static const routeName = 'leave-type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            AppSpacing.setVerticalSpace(80),
            Text(
              'Please select the type of leave you are'
              ' applying for from the cards.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 16.fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSpacing.setVerticalSpace(20),
            ...LeaveType.values
                .map(
                  (e) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.navigator.pushNamed(
                      RequestLeavePage.routeName,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 19,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.radius),
                        color: const Color(0xFFF3C3FF).withOpacity(.3),
                      ),
                      child: Row(
                        children: [
                          SvgImageAsset(e.iconPath),
                          AppSpacing.horizontalSpaceMedium,
                          Expanded(
                            child: Text(
                              e.title,
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

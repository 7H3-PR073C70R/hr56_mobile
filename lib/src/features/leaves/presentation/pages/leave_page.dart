import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/request_leave_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/widgets/leave_card.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/page_with_nested_route_scaffold.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  static const routeName = 'leave';
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isAdded,
      builder: (context, value, _) {
        return PageWithNestedRouteScaffold(
          fab: value
              ? FloatingActionButton(
                  onPressed: () => context.navigator.pushNamed(
                    RequestLeavePage.routeName,
                  ),
                  child: CircleAvatar(
                    radius: 36.radius,
                    backgroundColor: AppColors.primaryColor,
                    child: Center(
                      child: SvgImageAsset(
                        AppAssetPath.leaveSolid,
                        color: AppColors.whiteColor,
                        width: 32.width,
                        height: 28.height,
                      ),
                    ),
                  ),
                )
              : null,
          body: SafeArea(
            child: value
                ? Column(
                    children: [
                      Text(
                        'Leave history',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 20.fontSize,
                        ),
                      ),
                      AppSpacing.setVerticalSpace(25),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => LeaveCard(
                            status: LeaveStatus.values[index % 3],
                            approvalMessage: 'Awaiting approval from reliever',
                            date: '10/03/2023',
                            reason: 'Paternal leave ',
                            title: 'Parental Leave',
                          ),
                        ),
                      ),
                    ],
                  )
                : const LeaveEmptyState(),
          ),
        );
      },
    );
  }
}

class LeaveEmptyState extends StatelessWidget {
  const LeaveEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              'You have no leave request at the moment',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 20.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(58),
          const SvgImageAsset(AppAssetPath.leaveEmpty),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Button(
              width: 155.width,
              radius: 30,
              backgroundColor: AppColors.primaryColor,
              onPressed: () =>
                  context.navigator.pushNamed(RequestLeavePage.routeName),
              text: 'Request Leave',
            ),
          ),
          AppSpacing.setVerticalSpace(48),
        ],
      ),
    );
  }
}

final isAdded = ValueNotifier<bool>(false);

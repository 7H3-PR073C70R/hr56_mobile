import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_type_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/page_with_nested_route_scaffold.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  static const routeName = 'leave';
  @override
  Widget build(BuildContext context) {
    return PageWithNestedRouteScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
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
                      context.navigator.pushNamed(LeaveTypePage.routeName),
                  text: 'Request Leave',
                ),
              ),
              AppSpacing.setVerticalSpace(48),
            ],
          ),
        ),
      ),
    );
  }
}

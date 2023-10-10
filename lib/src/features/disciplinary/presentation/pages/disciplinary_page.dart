import 'package:flutter/material.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class DisciplinaryPage extends StatelessWidget {
  const DisciplinaryPage({super.key});

  static const routeName = 'disciplinary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Disciplinary',
            ),
            AppSpacing.setVerticalSpace(49),
            DisciplinaryCard(
              type: DisciplinaryType.queries,
              actions: '23',
              color: const Color(0xFF56006B),
              child: Positioned(
                left: 211.4.width,
                top: 22.26.height,
                child: const SvgImageAsset(AppAssetPath.alarm),
              ),
            ),
            AppSpacing.setVerticalSpace(20),
            DisciplinaryCard(
              type: DisciplinaryType.warnings,
              actions: '09',
              color: const Color(0xFF0063BF),
              child: Positioned(
                left: 154.08.width,
                top: 22.51.height,
                child: const SvgImageAsset(AppAssetPath.danger),
              ),
            ),
            AppSpacing.setVerticalSpace(20),
            DisciplinaryCard(
              type: DisciplinaryType.suspensions,
              actions: '12',
              color: const Color(0xFF02813C),
              child: Positioned(
                left: 242.99.width,
                top: 22.height,
                child: const SvgImageAsset(AppAssetPath.lock),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisciplinaryCard extends StatelessWidget {
  const DisciplinaryCard({
    super.key,
    required this.child,
    required this.type,
    required this.color,
    required this.actions,
  });

  final Widget child;
  final DisciplinaryType type;
  final Color color;
  final String actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.navigator.push(
        DisciplinaryListRoute(type: type),
      ),
      child: Container(
        width: double.infinity,
        height: 111.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.radius),
          color: color,
        ),
        child: Stack(
          children: [
            child,
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    actions,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 32.fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(2),
                  Text(
                    type.name.capitalizeFirst,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 24.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

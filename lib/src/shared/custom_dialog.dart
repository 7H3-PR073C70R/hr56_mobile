import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_view.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onActionPressed,
    required this.actionText,
    this.isSuccess = true,
  });

  final String title;
  final String description;
  final VoidCallback onActionPressed;
  final String actionText;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.radius),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SvgImageAsset(
              AppAssetPath.success,
            ),
            AppSpacing.setVerticalSpace(25),
            Text(
              title,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 16.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Text(
              description,
              textAlign: TextAlign.center,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 14.fontSize,
                color: const Color(0xFF8E8EA9),
              ),
            ),
            AppSpacing.setVerticalSpace(30),
            Button(
              onPressed: onActionPressed,
              text: actionText,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class PasswordValidatorBuilder extends StatelessWidget {
  const PasswordValidatorBuilder({
    super.key,
    required this.password,
  });

  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordValidator(
          text: 'Minimum of 6 characters',
          isEmpty: password.isEmpty,
          isValidated: password.length > 5,
        ),
        AppSpacing.setVerticalSpace(12),
        PasswordValidator(
          text: 'at least a number',
          isEmpty: password.isEmpty,
          isValidated: RegExp('[0-9]').hasMatch(password),
        ),
        AppSpacing.setVerticalSpace(12),
        PasswordValidator(
          text: 'a special character',
          isEmpty: password.isEmpty,
          isValidated:
              RegExp(r'^(?=.*?)(?=.*?[a-z])(?=.*?)(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(password),
        ),
      ],
    );
  }
}

class PasswordValidator extends StatelessWidget {
  const PasswordValidator({
    super.key,
    required this.isValidated,
    required this.isEmpty,
    required this.text,
  });

  final bool isValidated;
  final bool isEmpty;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgImageAsset(
          isEmpty
              ? AppAssetPath.emptyStar
              : isValidated
                  ? AppAssetPath.verifyStar
                  : AppAssetPath.errorStar,
        ),
        AppSpacing.horizontalSpaceTiny,
        Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.whiteColor,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    this.onEditTap,
    required this.header,
    required this.titles,
    required this.descriptions,
    this.add,
    this.showLine = true,
    this.headerTextStyle,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.dividerColor = AppColors.whiteColor,
  });

  final VoidCallback? onEditTap;
  final String header;
  final List<String> titles;
  final List<String> descriptions;
  final bool showLine;
  final Widget? add;
  final TextStyle? headerTextStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    assert(
      titles.length == descriptions.length,
      'Title and length needs to have the same length',
    );
    return Column(
      children: [
        AppSpacing.setVerticalSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          header,
                          style: headerTextStyle ??
                              context.textTheme.displayLarge?.copyWith(
                                fontSize: 20.fontSize,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor,
                              ),
                        ),
                        AppSpacing.setVerticalSpace(24),
                        ...List.generate(
                          titles.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    titles[index],
                                    style: titleTextStyle ??
                                        context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 15.fontSize,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    descriptions[index],
                                    style: descriptionTextStyle ??
                                        context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 15.fontSize,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (onEditTap != null)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onEditTap,
                      child: const SvgImageAsset(AppAssetPath.edit),
                    ),
                ],
              ),
            ],
          ),
        ),
        if (showLine) ...[
          AppSpacing.setVerticalSpace(10),
          Container(
            height: 8.height,
            width: double.infinity,
            color: dividerColor,
          ),
        ],
      ],
    );
  }
}

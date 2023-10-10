import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.selectedIconPath,
    this.selected = false,
    required this.onTap,
  });

  final String iconPath;
  final String selectedIconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: selected
                ? AppColors.primaryColor.withOpacity(.3)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              SvgImageAsset(
                selected ? selectedIconPath : iconPath,
                color:
                    selected ? AppColors.primaryColor : const Color(0xff292D32),
              ),
              if (selected) ...[
                AppSpacing.horizontalSpaceSmall,
                Text(
                  label,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 12.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/profile_page.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.width,
      margin: EdgeInsets.only(top: 50.height),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.verticalSpaceMedium,
          Padding(
            padding: EdgeInsets.only(left: 24.width),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.navigator.pushNamed(
                ProfilePage.routeName,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 30.radius,
                        backgroundColor: AppColors.greyColor,
                        backgroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q='
                          'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3hWiW-'
                          'pUQDnb&s',
                        ),
                      ),
                      Positioned(
                        top: 26.height,
                        left: 46.width,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => context.navigator.pushNamed(
                            ProfilePage.routeName,
                          ),
                          child: const SvgImageAsset(
                            AppAssetPath.editProfile,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.setVerticalSpace(10),
                  Text(
                    'Isaiah Nwankwo',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 16.fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(2),
                  Text(
                    'Isaiahnwankwo@gmail.com',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 12.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(2),
                  Text(
                    'Bridgegap Consults',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 12.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(16),
          Container(
            width: double.infinity,
            height: 1.height,
            color: const Color(0xFFCD3EF0).withOpacity(.3),
          ),
          AppSpacing.setVerticalSpace(16),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 24.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Profile',
                    iconPath: AppAssetPath.profile,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Disciplinary',
                    iconPath: AppAssetPath.disciplinary,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Request ID card',
                    iconPath: AppAssetPath.requestID,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Loan History',
                    iconPath: AppAssetPath.loanSolid,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Leave History',
                    iconPath: AppAssetPath.leaveSolid,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Appraisal',
                    iconPath: AppAssetPath.appraisal,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Change password',
                    iconPath: AppAssetPath.changePassword,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Help  & Support',
                    iconPath: AppAssetPath.helpAndSupport,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Log Out',
                    iconPath: AppAssetPath.logout,
                  ),
                  AppSpacing.setVerticalSpace(15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconPath,
  });

  final VoidCallback onTap;
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 32.height,
            width: 33.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.radius),
              color: const Color(0xFF039847),
            ),
            child: SvgImageAsset(
              iconPath,
              color: AppColors.whiteColor,
            ),
          ),
          AppSpacing.horizontalSpaceSmall,
          Text(
            text,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

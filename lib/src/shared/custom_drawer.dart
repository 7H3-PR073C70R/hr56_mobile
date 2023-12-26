// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/pages/appraisal_request_page.dart';
import 'package:hr56_staff/src/features/disciplinary/presentation/pages/disciplinary_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_history_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_history_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/help_and_support_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/id_photo_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/profile_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/update_password_page.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class CustomDrawer extends HookWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = useMemoized(() => locator<UserStorageService>().user);
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
                        backgroundImage: user?.profilePhotoPath == null
                            ? null
                            : NetworkImage(
                                user?.profilePhotoPath ?? '',
                              ),
                        onBackgroundImageError: user?.profilePhotoPath == null
                            ? null
                            : (exception, stackTrace) {
                                debugPrint(
                                  'Image error: ${user?.profilePhotoPath}',
                                );
                              },
                        child: user?.profilePhotoPath == null
                            ? Center(
                                child: Text(
                                  '${user?.firstName?.split('').firstOrNull ?? ''}'
                                  '${user?.lastName?.split('').firstOrNull ?? ''}',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 28.fontSize,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              )
                            : null,
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
                    '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 16.fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(2),
                  Text(
                    user?.email ?? '',
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
                    onTap: () => context.navigator.pushNamed(
                      ProfilePage.routeName,
                    ),
                    text: 'Profile',
                    iconPath: AppAssetPath.profile,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      IDPhotoPage.routeName,
                    ),
                    text: 'Request ID card',
                    iconPath: AppAssetPath.requestID,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      LoanHistoryPage.routeName,
                    ),
                    text: 'Loan History',
                    iconPath: AppAssetPath.loanSolid,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      LeaveHistoryPage.routeName,
                    ),
                    text: 'Leave History',
                    iconPath: AppAssetPath.leaveSolid,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      AppraisalRequestPage.routeName,
                    ),
                    text: 'Appraisal',
                    iconPath: AppAssetPath.appraisal,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      UpdatePasswordPage.routeName,
                    ),
                    text: 'Change password',
                    iconPath: AppAssetPath.changePassword,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      DisciplinaryPage.routeName,
                    ),
                    text: 'Disciplinary',
                    iconPath: AppAssetPath.disciplinary,
                  ),
                  AppSpacing.setVerticalSpace(32),
                  DrawerMenuItem(
                    onTap: () => context.navigator.pushNamed(
                      HelpAndSupportPage.routeName,
                    ),
                    text: 'Help & Support',
                    iconPath: AppAssetPath.helpAndSupport,
                  ),
                  AppSpacing.setVerticalSpace(81),
                  DrawerMenuItem(
                    onTap: () {},
                    text: 'Log Out',
                    isLogout: true,
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
    this.isLogout = false,
  });

  final VoidCallback onTap;
  final String text;
  final String iconPath;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
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
              color: isLogout ? AppColors.errorColor : AppColors.whiteColor,
            ),
          ),
          AppSpacing.horizontalSpaceSmall,
          Text(
            text,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w500,
              color: isLogout ? AppColors.errorColor : AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

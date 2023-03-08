import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.height,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            iconPath: AppAssetPath.homeOutline,
            selectedIconPath: AppAssetPath.homeSolid,
            label: 'Home',
            onTap: () => tabsRouter.setActiveIndex(0),
            selected: tabsRouter.activeIndex == 0,
          ),
          NavBarItem(
            iconPath: AppAssetPath.leaveOutline,
            selectedIconPath: AppAssetPath.leaveSolid,
            label: 'Leaves',
            onTap: () => tabsRouter.setActiveIndex(1),
            selected: tabsRouter.activeIndex == 1,
          ),
          NavBarItem(
            iconPath: AppAssetPath.loanOutline,
            selectedIconPath: AppAssetPath.loanSolid,
            label: 'Loans',
            onTap: () => tabsRouter.setActiveIndex(2),
            selected: tabsRouter.activeIndex == 2,
          ),
          NavBarItem(
            iconPath: AppAssetPath.payslipOutline,
            selectedIconPath: AppAssetPath.payslipSolid,
            label: 'Payslip',
            onTap: () => tabsRouter.setActiveIndex(3),
            selected: tabsRouter.activeIndex == 3,
          ),
          NavBarItem(
            iconPath: AppAssetPath.walletOutline,
            selectedIconPath: AppAssetPath.walletSolid,
            label: 'Wallet',
            onTap: () => tabsRouter.setActiveIndex(4),
            selected: tabsRouter.activeIndex == 4,
          ),
        ],
      ),
    );
  }
}

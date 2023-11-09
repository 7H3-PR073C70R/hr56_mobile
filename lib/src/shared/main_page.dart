import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/shared/custom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        LeaveRoute(),
        LoanRoute(),
        PayslipRoute(),
        WalletRoute(),
      ],
      animationCurve: Curves.easeInCubic,
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomNavBar(
          tabsRouter: tabsRouter,
        );
      },
    );
  }
}

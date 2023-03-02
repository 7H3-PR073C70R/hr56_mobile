import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
    // return AutoTabsScaffold(
    //   routes: const [],
    //   animationCurve: Curves.easeInCubic,
    //   bottomNavigationBuilder: (_, tabsRouter) {
    //     return CustomNavBar(
    //       tabsRouter: tabsRouter,
    //     );
    //   },
    // );
  }
}

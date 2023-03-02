import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/shared/main_page.dart';

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      path: MainPage.routeName,
      initial: true,
    )
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

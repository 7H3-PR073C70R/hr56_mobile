import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/login_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/onboarding_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hr56_staff/src/shared/main_page.dart';

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: OnboardingPage,
      path: OnboardingPage.routeName,
      initial: true,
    ),
    AutoRoute(
      page: LoginPage,
      path: LoginPage.routeName,
    ),
    AutoRoute(
      page: ForgotPasswordPage,
      path: ForgotPasswordPage.routeName,
    ),
    AutoRoute(
      page: ResetPasswordPage,
      path: ResetPasswordPage.routeName,
    ),
    AutoRoute(
      page: MainPage,
      path: MainPage.routeName,
    )
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

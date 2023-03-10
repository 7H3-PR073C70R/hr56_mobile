import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/login_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/onboarding_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hr56_staff/src/features/home/presentation/pages/home_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/request_leave_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_form_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/request_loan_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/verify_account_page.dart';
import 'package:hr56_staff/src/features/payslip/presentation/pages/payslip_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/wallet_page.dart';
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
      children: [
        AutoRoute(
          page: HomePage,
          path: HomePage.routeName,
        ),
        AutoRoute(
          page: LeavePage,
          path: LeavePage.routeName,
          children: [
            AutoRoute(
              page: RequestLeavePage,
              path: RequestLeavePage.routeName,
            ),
          ],
        ),
        AutoRoute(
          page: LoanPage,
          path: LoanPage.routeName,
          children: [
            AutoRoute(
              page: RequestLoanPage,
              path: RequestLoanPage.routeName,
            ),
            AutoRoute(
              page: VerifyAccountPage,
              path: VerifyAccountPage.routeName,
            ),
            AutoRoute(
              page: LoanFormPage,
              path: LoanFormPage.routeName,
            ),
          ],
        ),
        AutoRoute(
          page: PayslipPage,
          path: PayslipPage.routeName,
        ),
        AutoRoute(
          page: WalletPage,
          path: WalletPage.routeName,
        ),
      ],
    )
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

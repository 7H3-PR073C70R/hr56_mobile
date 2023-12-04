import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/auth_congratulations_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/login_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/onboarding_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/onboarding_questionnaire_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hr56_staff/src/features/disciplinary/presentation/pages/disciplinary_list_page.dart';
import 'package:hr56_staff/src/features/disciplinary/presentation/pages/disciplinary_page.dart';
import 'package:hr56_staff/src/features/disciplinary/presentation/pages/disciplinary_summary_page.dart';
import 'package:hr56_staff/src/features/home/presentation/pages/home_page.dart';
import 'package:hr56_staff/src/features/home/presentation/pages/notification_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_history_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/leave_type_page.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/request_leave_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_form_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_history_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/loan_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/request_loan_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/verify_account_page.dart';
import 'package:hr56_staff/src/features/payslip/presentation/pages/payslip_details_page.dart';
import 'package:hr56_staff/src/features/payslip/presentation/pages/payslip_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/bank_details_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/emergency_contact_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/guarantor_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/help_and_support_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/id_photo_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/next_of_kin_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/personal_info_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/profile_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/reference_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/spouse_details_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/update_password_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/confirm_transaction_pin_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/create_transaction_pin_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/fund_wallet_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/beneficiary_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/review_transfer_details_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/transfer_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/wallet_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/withdraw_page.dart';
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
      page: NotificationPage,
      path: NotificationPage.routeName,
    ),
    AutoRoute(
      page: ProfilePage,
      path: ProfilePage.routeName,
    ),
    AutoRoute(
      page: BankDetailsPage,
      path: BankDetailsPage.routeName,
    ),
    AutoRoute(
      page: EmergencyContactPage,
      path: EmergencyContactPage.routeName,
    ),
    AutoRoute(
      page: GuarantorPage,
      path: GuarantorPage.routeName,
    ),
    AutoRoute(
      page: NextOfKinPage,
      path: NextOfKinPage.routeName,
    ),
    AutoRoute(
      page: PersonalInfoPage,
      path: PersonalInfoPage.routeName,
    ),
    AutoRoute(
      page: ReferencePage,
      path: ReferencePage.routeName,
    ),
    AutoRoute(
      page: SpouseDetailsPage,
      path: SpouseDetailsPage.routeName,
    ),
    AutoRoute(
      page: AuthCongratulationsPage,
      path: AuthCongratulationsPage.routeName,
    ),
    AutoRoute(
      page: IDPhotoPage,
      path: IDPhotoPage.routeName,
    ),
    AutoRoute(
      page: OnboardingQuestionnairePage,
      path: OnboardingQuestionnairePage.routeName,
    ),
    AutoRoute(
      page: LoanHistoryPage,
      path: LoanHistoryPage.routeName,
    ),
    AutoRoute(
      page: LeaveHistoryPage,
      path: LeaveHistoryPage.routeName,
    ),
    AutoRoute(
      page: DisciplinaryPage,
      path: DisciplinaryPage.routeName,
    ),
    AutoRoute(
      page: DisciplinaryListPage,
      path: DisciplinaryListPage.routeName,
    ),
    AutoRoute(
      page: DisciplinarySummaryPage,
      path: DisciplinarySummaryPage.routeName,
    ),
    AutoRoute(
      page: HelpAndSupportPage,
      path: HelpAndSupportPage.routeName,
    ),
    AutoRoute(
      page: UpdatePasswordPage,
      path: UpdatePasswordPage.routeName,
    ),
    AutoRoute(
      page: BeneficiaryPage,
      path: BeneficiaryPage.routeName,
    ),
    AutoRoute(
      page: ReviewTransferDetailsPage,
      path: ReviewTransferDetailsPage.routeName,
    ),
    AutoRoute(
      page: TransferPage,
      path: TransferPage.routeName,
    ),
    AutoRoute(
      page: FundWalletPage,
      path: FundWalletPage.routeName,
    ),
    AutoRoute(
      page: WithdrawPage,
      path: WithdrawPage.routeName,
    ),
    AutoRoute(
      page: ConfirmTransactionPinPage,
      path: ConfirmTransactionPinPage.routeName,
    ),
    AutoRoute(
      page: CreateTransactionPinPage,
      path: CreateTransactionPinPage.routeName,
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
            AutoRoute(
              page: LeaveTypePage,
              path: LeaveTypePage.routeName,
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
          children: [
            AutoRoute(
              page: PayslipDetailsPage,
              path: PayslipDetailsPage.routeName,
            ),
          ],
        ),
        AutoRoute(
          page: WalletPage,
          path: WalletPage.routeName,
        ),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

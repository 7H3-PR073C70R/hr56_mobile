import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';

extension ResponsiveExtension on num {
  double get width => w;
  double get height => h;
  double get fontSize => sp;
  double get radius => r;
}

extension RouterExtension on BuildContext {
  StackRouter get navigator => router;
  void popUntilMain() => navigator.popUntil(
        (route) => route.settings.name == MainRoute.name,
      );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension ViewStateExtension on ViewState {
  bool get isIdle => this == ViewState.idle;
  bool get isProcessing => this == ViewState.processing;
  bool get isSuccess => this == ViewState.success;
  bool get isError => this == ViewState.error;
}

extension LeaveStatusExtension on LeaveStatus {
  bool get isPending => this == LeaveStatus.pending;
  bool get isApproved => this == LeaveStatus.approved;
  bool get isDenied => this == LeaveStatus.denied;

  Color get color {
    switch (this) {
      case LeaveStatus.pending:
        return const Color(0xFFF3A804);
      case LeaveStatus.approved:
        return const Color(0xFF039847);
      case LeaveStatus.denied:
        return const Color(0xFFEE2011);
    }
  }
}

extension LoanStatusExtension on LoanStatus {
  bool get isApproved => this == LoanStatus.approved;
  bool get isPending => this == LoanStatus.pending;
  bool get isDecline => this == LoanStatus.declined;
  bool get isDisbursed => this == LoanStatus.disbursed;

  Color get color {
    switch (this) {
      case LoanStatus.approved:
        return const Color(0xFF00BA00);
      case LoanStatus.pending:
        return const Color(0xFFF3A804);
      case LoanStatus.declined:
        return const Color(0xFFCC1D10);
      case LoanStatus.disbursed:
        return const Color(0xFF037EEF);
    }
  }
}

extension UserInfoExtension on UserInformation {
  String get text1 {
    switch (this) {
      case UserInformation.personal:
        return 'Cheers almost there fill in your';
      case UserInformation.nextOfKin:
        return 'Yes you are almost close, fill your';
      case UserInformation.bank:
        return 'Yes you are almost close, fill in';
      case UserInformation.guarantor:
        return 'We feel it  you are closer than ever, fill in';
      case UserInformation.emergency:
        return 'Cheers you got here finally, fill in';
    }
  }

  String get text2 {
    switch (this) {
      case UserInformation.personal:
        return 'next of kin details.';
      case UserInformation.nextOfKin:
        return 'Bank details.';
      case UserInformation.bank:
        return 'Guarantor details.';
      case UserInformation.guarantor:
        return 'Emergency contact';
      case UserInformation.emergency:
        return 'References';
    }
  }

  String get buttonText {
    switch (this) {
      case UserInformation.personal:
        return 'Fill next of kin details';
      case UserInformation.nextOfKin:
        return 'Fill bank details';
      case UserInformation.bank:
        return 'Fill guarantor details';
      case UserInformation.guarantor:
        return 'Fill emergency contact';
      case UserInformation.emergency:
        return 'Fill references';
    }
  }

  String get imagePath {
    switch (this) {
      case UserInformation.personal:
      case UserInformation.emergency:
        return AppAssetPath.personalInfoSuccess;
      case UserInformation.nextOfKin:
        return AppAssetPath.nextOfKinSuccess;
      case UserInformation.bank:
      case UserInformation.guarantor:
        return AppAssetPath.guarantorSuccess;
    }
  }

  VoidCallback onPressed(BuildContext context) {
    switch (this) {
      case UserInformation.personal:
        return () => context.navigator.replace(
              NextOfKinRoute(isAfterLogin: true),
            );
      case UserInformation.nextOfKin:
        return () => context.navigator.replace(
              BankDetailsRoute(isAfterLogin: true),
            );
      case UserInformation.bank:
        return () => context.navigator.replace(
              GuarantorRoute(isAfterLogin: true),
            );
      case UserInformation.guarantor:
        return () => context.navigator.replace(
              EmergencyContactRoute(isAfterLogin: true),
            );
      case UserInformation.emergency:
        return () => context.navigator.replace(
              ReferenceRoute(isAfterLogin: true),
            );
    }
  }
}

extension StringExtension on String {
  String get capitalizeFirst => this[0].toUpperCase() + substring(1);
}

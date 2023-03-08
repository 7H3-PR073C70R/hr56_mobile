import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
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

extension StringExtension on String {
  String get capitalizeFirst => this[0].toUpperCase() + substring(1);
}

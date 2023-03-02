import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/shared/main_page.dart';

extension ResponsiveExtension on num {
  double get width => w;
  double get height => h;
  double get fontSize => sp;
  double get radius => r;
}

extension RouterExtension on BuildContext {
  StackRouter get navigator => router;
  void popUntilMain() => navigator.popUntil(
        (route) => route.settings.name == MainPage.routeName,
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

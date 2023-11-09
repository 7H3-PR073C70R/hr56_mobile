import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelpers {
  // screen size
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // sized box that takes a certain percentage of the screen width
  static Widget screenHeightPercent(
    BuildContext context, {
    double percent = 1,
  }) =>
      SizedBox(height: screenHeight(context) * percent);

  static Widget screenWidthPercent(
    BuildContext context, {
    double percent = 1,
  }) =>
      SizedBox(width: screenWidth(context) * percent);

  // sized box that takes a width and height
  static Widget verticalSpacer(double height) => SizedBox(height: height.h);
  static Widget horizontalSpacer(double width) => SizedBox(width: width.w);

  static Widget get vspaceSm => verticalSpacer(8);
  static Widget get vspaceMd => verticalSpacer(24);
  static Widget get vspaceLg => verticalSpacer(64);

  static Widget get hspaceSm => horizontalSpacer(8);
  static Widget get hspaceMd => horizontalSpacer(24);
  static Widget get hspaceLg => horizontalSpacer(64);
}

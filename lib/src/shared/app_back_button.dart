import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        height: 43.h,
        width: 45.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.radius),
          color: const Color(0xFFF5F5F5),
        ),
        child: Icon(
          Icons.adaptive.arrow_back,
          size: 26,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}

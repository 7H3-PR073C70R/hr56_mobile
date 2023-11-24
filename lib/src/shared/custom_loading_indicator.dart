import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.backgroundColor = AppColors.primaryColor,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CircularProgressIndicator(color: backgroundColor);
    }
    return Transform.scale(
      scale: 2,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: backgroundColor,
      ),
    );
  }
}

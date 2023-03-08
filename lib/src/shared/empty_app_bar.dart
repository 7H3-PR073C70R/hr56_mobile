import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';

class EmptyAppBar extends StatelessWidget with PreferredSizeWidget {
  const EmptyAppBar({
    super.key,
    this.isDark = true,
    this.backgroundColor = AppColors.whiteColor,
  });

  final Color backgroundColor;

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 1,
      backgroundColor: backgroundColor,
      systemOverlayStyle:
          isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size(1, 1);
}

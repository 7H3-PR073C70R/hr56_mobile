import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({
    super.key,
    this.isDark = true,
    this.leading,
    this.height = 1,
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  final Color backgroundColor;

  final bool isDark;
  final Widget? leading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
      leading: leading,
      systemOverlayStyle:
          isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize =>  Size(height, height);
}

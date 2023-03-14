import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyAppBar extends StatelessWidget with PreferredSizeWidget {
  const EmptyAppBar({
    super.key,
    this.isDark = true,
    this.backgroundColor = const Color(0xFFF5F5F5),
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

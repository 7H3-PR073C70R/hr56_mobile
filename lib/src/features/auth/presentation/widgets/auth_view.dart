import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: [
          const SvgImageAsset(AppAssetPath.authBackground),
          body,
        ],
      ),
    );
  }
}

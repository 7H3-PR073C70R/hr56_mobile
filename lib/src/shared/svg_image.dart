import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageAsset extends StatelessWidget {
  const SvgImageAsset(
    this.imagePath, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
  });

  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      color: color,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    );
  }
}

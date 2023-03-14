import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator(
      {super.key, required this.currentIndex, required this.length,});

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 8.height,
            width: currentIndex == i ? 60.width : 22.width,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: currentIndex == i
                  ? const Color(0xFF02C55C)
                  : const Color(0xFFE4E9EE),
              borderRadius: BorderRadius.circular(30.radius),
            ),
          ),
      ],
    );
  }
}

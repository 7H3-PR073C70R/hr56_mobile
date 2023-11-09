import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/success_modal.dart';

Future<void> showInfoCustomModel(
  BuildContext context,
  UserInformation info,
  PageController? controller, [
  bool isSpouse = false,
  String? text1,
  String? text2,
  String? buttonText,
]) =>
    showModalBottomSheet<Widget>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.radius),
          topRight: Radius.circular(25.radius),
        ),
      ),
      context: context,
      builder: (_) => SuccessModal(
        buttonText: buttonText ?? info.buttonText,
        onPressed: () {
          if (controller != null) {
            Navigator.of(context).pop();

            if (!isSpouse && info == UserInformation.personal) {
              final page = (controller.page ?? 0).toInt() + 2;
              controller.animateToPage(
                page,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            } else {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            }
          } else {
            info.onPressed(context, isSpouse);
          }
        },
        text1: text1 ?? info.text1,
        text2: text2 ?? info.text2,
        imagePath: info.imagePath,
      ),
    );

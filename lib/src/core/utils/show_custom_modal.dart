import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/success_modal.dart';

Future<void> showInfoCustomModel(BuildContext context, UserInformation info,
        [bool isSpouse = false,
        String? text1,
        String? text2,
        String? buttonText,]) =>
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
        onPressed: info.onPressed(context, isSpouse),
        text1: text1 ?? info.text1,
        text2: text2 ?? info.text2,
        imagePath: info.imagePath,
      ),
    );

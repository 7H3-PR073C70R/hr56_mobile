import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';
import 'package:intl/intl.dart';

class DatePickerFormCard extends HookWidget {
  const DatePickerFormCard({
    super.key,
    this.label,
    this.onChanged,
    this.initialValue,
    this.hintText,
  });

  final String? label;
  final String? initialValue;
  final String? hintText;
  final ValueChanged<DateTime?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);
    return CustomInputField(
      controller: controller,
      label: label,
      hintText: hintText,
      keyboardType: TextInputType.datetime,
      onTap: () {
        final date = controller.text.split('/');
        showDatePicker(
          context: context,
          initialDate: controller.text.isEmpty && date.length != 3
              ? DateTime.now()
              : DateTime.utc(
                  (int.tryParse(date[2]) ?? 2022) > DateTime.now().year
                      ? DateTime.now().year
                      : int.tryParse(date[2]) ?? 2022,
                  (int.tryParse(date[1]) ?? 1) > DateTime.now().month
                      ? DateTime.now().month
                      : int.tryParse(date[1]) ?? 1,
                  (int.tryParse(date[0]) ?? 1) > DateTime.now().day
                      ? DateTime.now().day
                      : int.tryParse(date[0]) ?? 1,
                ),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then(
          (value) {
            if (value == null) return;
            onChanged?.call(value);
            controller.text = DateFormat('dd/MM/yyyy').format(value);
          },
        );
      },
      suffixIcon: IconButton(
        onPressed: () {
          final date = controller.text.split('/');
          showDatePicker(
            context: context,
            initialDate: controller.text.isEmpty && date.length != 3
                ? DateTime.now()
                : DateTime.utc(
                    (int.tryParse(date[2]) ?? 2022) > DateTime.now().year
                        ? DateTime.now().year
                        : int.tryParse(date[2]) ?? 2022,
                    (int.tryParse(date[1]) ?? 1) > DateTime.now().month
                        ? DateTime.now().month
                        : int.tryParse(date[1]) ?? 1,
                    (int.tryParse(date[0]) ?? 1) > DateTime.now().day
                        ? DateTime.now().day
                        : int.tryParse(date[0]) ?? 1,
                  ),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ).then(
            (value) {
              if (value == null) return;
              onChanged?.call(value);
              controller.text = DateFormat('dd/MM/yyyy').format(value);
            },
          );
        },
        icon: Padding(
          padding: const EdgeInsets.all(6),
          child: SvgImageAsset(
            AppAssetPath.calendar,
            height: 24.radius,
            width: 24.radius,
          ),
        ),
      ),
    );
  }
}

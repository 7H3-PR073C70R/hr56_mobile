import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class CustomDropDownButton extends HookWidget {
  const CustomDropDownButton({
    super.key,
    this.label,
    required this.texts,
    this.hintText,
    this.onChanged,
    this.value,
  });

  final String? label;
  final String? hintText;
  final String? value;
  final List<String> texts;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final valueState = useState(value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          AppSpacing.verticalSpaceTiny,
        ],
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.width,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFFC1CDDA),
              width: 2,
            ),
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.radius),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: valueState.value,
              isExpanded: true,
              hint: hintText != null ? Text(hintText!) : null,
              onChanged: (value) {
                if (value == null) return;
                valueState.value = value;
                onChanged?.call(value);
              },
              items: List.generate(
                texts.length,
                (index) => DropdownMenuItem(
                  value: texts[index],
                  child: Text(
                    texts[index],
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 14.fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

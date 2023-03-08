import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class CustomCheckBox extends HookWidget {
  const CustomCheckBox({
    super.key,
    this.onChanged,
    this.text,
    this.textWidget,
    this.textStyle,
    this.value = false,
  });

  final ValueChanged<bool>? onChanged;
  final String? text;
  final Widget? textWidget;
  final bool value;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    assert(
      textWidget == null || text == null,
      'Text and TextWidget cannot be both null',
    );
    final state = useState(value);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            state.value = !state.value;
            onChanged?.call(state.value);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: state.value
                  ? null
                  : Border.all(
                      width: 1.5,
                    ),
              color: state.value ? const Color(0xFF0671E0) : null,
            ),
            child: state.value ? const SvgImageAsset(AppAssetPath.check) : null,
          ),
        ),
        AppSpacing.horizontalSpaceSmall,
        Expanded(
          child: textWidget ??
              Text(
                text ?? '',
                style: textStyle ??
                    context.textTheme.displayLarge?.copyWith(
                      fontSize: 14.fontSize,
                    ),
              ),
        ),
      ],
    );
  }
}

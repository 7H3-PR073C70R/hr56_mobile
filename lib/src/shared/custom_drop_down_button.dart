import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';

class CustomDropDownButton extends HookWidget {
  const CustomDropDownButton({
    super.key,
    this.label,
    required this.texts,
    this.hintText,
    this.onChanged,
    this.value,
    this.isSearchable = false,
  });

  final String? label;
  final String? hintText;
  final String? value;
  final List<String> texts;
  final ValueChanged<String?>? onChanged;
  final bool isSearchable;

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
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFCCCCCC),
              width: 2,
            ),
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.radius),
          ),
          child: DropdownButtonHideUnderline(
            child: isSearchable
                ? DropdownSearch<String>(
                    validator: context.validateFieldNotEmpty,
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      fit: FlexFit.loose,
                      containerBuilder: (context, popupWidget) => DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFCCCCCC),
                          ),
                          borderRadius: BorderRadius.circular(16.radius),
                        ),
                        child: popupWidget,
                      ),
                      menuProps: MenuProps(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.radius),
                        ),
                      ),
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const UnconstrainedBox(
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(
                            18.radius,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    items: texts,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.radius,
                          vertical: 14.height,
                        ),
                      ),
                      baseStyle: context.textTheme.displayLarge?.copyWith(
                        fontSize: 14.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (value) {
                      if (value == null) return;
                      onChanged?.call(value);
                    },
                    selectedItem: value,
                    dropdownButtonProps: DropdownButtonProps(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.radius,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.width,
                    ),
                    child: DropdownButton<String>(
                      value: valueState.value,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: const Color(0xFF1E222B),
                        size: 32.radius,
                      ),
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class DisciplinaryListPage extends StatelessWidget {
  const DisciplinaryListPage({super.key, required this.type});

  static const routeName = 'disciplinary-list';

  final DisciplinaryType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomAppBarWithBackButton(
              text: type.name.capitalizeFirst,
            ),
          ),
          AppSpacing.setVerticalSpace(36),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                splashColor: const Color(0xFFE1C2E9),
                onTap: () => context.navigator.push(
                  DisciplinarySummaryRoute(
                    type: type,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCF2FE).withOpacity(.25),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFFE1C2E9).withOpacity(.5),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Missing work day',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 20.fontSize,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      AppSpacing.verticalSpaceTiny,
                      Text(
                        '${index + 13}-03-2023',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 15.fontSize,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}

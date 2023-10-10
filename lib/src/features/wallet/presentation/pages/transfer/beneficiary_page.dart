import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/search_field.dart';

class BeneficiaryPage extends StatelessWidget {
  const BeneficiaryPage({super.key});

  static const routeName = 'beneficiary-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Beneficiaries',
            ),
            AppSpacing.setVerticalSpace(40.5),
            const SearchField(
              hint: 'Search beneficiary',
            ),
            AppSpacing.setVerticalSpace(36),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Row(
                  children: [
                    CircleAvatar(
                      radius: 26.5.radius,
                      backgroundColor: AppColors.greyColor,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 40.height,
                        ),
                      ),
                    ),
                    AppSpacing.setHorizontalSpace(12),
                    Text(
                      AppStrings.nameList[index],
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1B1C1E),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => AppSpacing.verticalSpaceLarge,
                itemCount: AppStrings.nameList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

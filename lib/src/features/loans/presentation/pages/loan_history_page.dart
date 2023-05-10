import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_card.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/search_field.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LoanHistoryPage extends StatelessWidget {
  const LoanHistoryPage({super.key});

  static const routeName = 'loan-history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Loan History',
          ),
          AppSpacing.setVerticalSpace(20),
          const _Header(),
          AppSpacing.setVerticalSpace(25),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => LoanCard(
                status: LoanStatus.values[index % 4],
                amount: '22,000',
                date: '23/03/2023',
                info: '12SER23',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SearchField(
            hint: 'Parental leave',
            suffixIcon: GestureDetector(
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: SvgImageAsset(
                  AppAssetPath.calendar,
                ),
              ),
            ),
          ),
          AppSpacing.verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: SizedBox(
              height: 30.height,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.width),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF56006B),
                    ),
                    borderRadius: BorderRadius.circular(20.radius),
                  ),
                  child: Text(
                    LoanStatus.values[index].name.capitalizeFirst,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF56006B),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => AppSpacing.horizontalSpaceMedium,
                itemCount: LoanStatus.values.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

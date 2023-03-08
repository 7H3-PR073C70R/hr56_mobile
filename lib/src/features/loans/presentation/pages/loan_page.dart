import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/request_loan_page.dart';
import 'package:hr56_staff/src/features/loans/presentation/widgets/loan_card.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/page_with_nested_route_scaffold.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({super.key});

  static const routeName = 'loan';
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loanRequested,
      builder: (context, value, _) {
        if (value) {
          return PageWithNestedRouteScaffold(
            fab: FloatingActionButton(
              onPressed: () => context.navigator.pushNamed(
                RequestLoanPage.routeName,
              ),
              child: CircleAvatar(
                radius: 36.radius,
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: SvgImageAsset(
                    AppAssetPath.loanSolid,
                    color: AppColors.whiteColor,
                    width: 32.width,
                    height: 28.height,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Text(
                    'Loan history',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 20.fontSize,
                    ),
                  ),
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
            ),
          );
        }
        return PageWithNestedRouteScaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      'No loan history at the moment',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(60),
                  const SvgImageAsset(AppAssetPath.noLoan),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Button(
                      width: 155.width,
                      radius: 30,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () => context.navigator
                          .pushNamed(RequestLoanPage.routeName),
                      text: 'Request loan',
                    ),
                  ),
                  AppSpacing.setVerticalSpace(48),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final loanRequested = ValueNotifier(false);

import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/loans/presentation/pages/request_loan_page.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/page_with_nested_route_scaffold.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({super.key});

  static const routeName = 'loan';
  @override
  Widget build(BuildContext context) {
    return PageWithNestedRouteScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              AppSpacing.setVerticalSpace(60),
              const SvgImageAsset(AppAssetPath.noLoan),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Button(
                  width: 155.width,
                  radius: 30,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () =>
                      context.navigator.pushNamed(RequestLoanPage.routeName),
                  text: 'Request loan',
                ),
              ),
              AppSpacing.setVerticalSpace(48),
            ],
          ),
        ),
      ),
    );
  }
}

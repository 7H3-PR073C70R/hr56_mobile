import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/payslip/presentation/pages/payslip_details_page.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/page_with_nested_route_scaffold.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class PayslipPage extends HookWidget {
  const PayslipPage({super.key});

  static const routeName = 'payslip';
  @override
  Widget build(BuildContext context) {
    final showList = useState(false);
    return PageWithNestedRouteScaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: AppSpacing.screenHeight(context),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            crossFadeState: showList.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => showList.value = true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have no payslip details at the moment',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.setVerticalSpace(30),
                    const SvgImageAsset(AppAssetPath.emptyPayslip),
                  ],
                ),
              ),
            ),
            secondChild: SizedBox(
              width: double.infinity,
              height: AppSpacing.screenHeight(context),
              child: Column(
                children: [
                  const CustomAppBarWithBackButton(
                    text: 'Payslip history',
                    showLeading: false,
                  ),
                  AppSpacing.setVerticalSpace(30),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                        height: 50.height,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.white
                              : const Color(0xFFF0D3FF),
                          border: Border(
                            bottom: index.isEven
                                ? const BorderSide(
                                    color: Color(0xFFEEEFF1),
                                  )
                                : BorderSide.none,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Pay slip       January 2023',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 16.fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => context.navigator
                                  .pushNamed(PayslipDetailsPage.routeName),
                              child: Text(
                                'view details',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 14.fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greenColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (_, __) =>
                          AppSpacing.verticalSpaceSmall,
                      itemCount: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

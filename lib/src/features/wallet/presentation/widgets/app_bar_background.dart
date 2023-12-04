// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/helper_function.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/create_transaction_pin_page.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class AppBarBackground extends HookWidget {
  const AppBarBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showAccount = useState(true);
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        final amount = double.tryParse(
              state.walletInfo?.availableBalance ?? '',
            ) ??
            0;

        return Container(
          color: const Color(0xFF56006B),
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppSpacing.setVerticalSpace(52),
                Container(
                  height: 179.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.radius),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF039847),
                        AppColors.blackColor.withOpacity(.67),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssetPath.cardBG,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 13,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.walletInfo?.walletName ?? '',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 14.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 93.width,
                                  child: Column(
                                    children: [
                                      Image.asset(AppAssetPath.cardLogo),
                                      AppSpacing.verticalSpaceTiny,
                                      Text(
                                        state.walletInfo?.bankName ?? '',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 10.fontSize,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${AppStrings.naira}'
                                  '${!showAccount.value ? '*' * 8 : amount.toAmount}',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 30.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                AppSpacing.setHorizontalSpace(23.5),
                                GestureDetector(
                                  onTap: () =>
                                      showAccount.value = !showAccount.value,
                                  child: Icon(
                                    showAccount.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Account number',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 12.fontSize,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(6.5),
                            Row(
                              children: [
                                Text(
                                  state.walletInfo?.accountNumber ?? '',
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
                                    fontSize: 12.fontSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                AppSpacing.setHorizontalSpace(9.6),
                                GestureDetector(
                                  child: const SvgImageAsset(AppAssetPath.copy),
                                  onTap: () => copyToClipboard(
                                    state.walletInfo?.accountNumber ?? '',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.setVerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: WalletAction.values
                      .map(
                        (action) => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (state.transactionPINSet) {
                              context.navigator.pushNamed(action.route);
                            } else {
                              context.navigator.pushNamed(
                                CreateTransactionPinPage.routeName,
                              );
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60.radius,
                                width: 60.radius,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor.withOpacity(
                                    .3,
                                  ),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                child: SvgImageAsset(
                                  action.asset,
                                  height: 34.radius,
                                  width: 34.radius,
                                ),
                              ),
                              AppSpacing.verticalSpaceSmall,
                              Text(
                                action.title,
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 16.fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

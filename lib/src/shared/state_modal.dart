import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class StateModal extends StatelessWidget {
  const StateModal({
    super.key,
    required this.isSuccessful,
    required this.message,
  });

  final bool isSuccessful;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 482.height,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          AppSpacing.setVerticalSpace(10),
          Center(
            child: Container(
              height: 7.9.height,
              width: 80.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.radius),
                color: const Color(0xFFE6E5E4),
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(48),
          if (isSuccessful)
            const Center(
              child: SvgImageAsset(
                AppAssetPath.transferSuccessful,
              ),
            )
          else
            Container(
              height: 99.17.radius,
              width: 99.17.radius,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFBB1AB),
              ),
              child: const SvgImageAsset(AppAssetPath.transferUnsuccessful),
            ),
          AppSpacing.setVerticalSpace(34.45),
          Text(
            isSuccessful ? 'Withdrawal successful' : 'Withdrawal unsuccessful',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 18.fontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1E222B),
            ),
          ),
          AppSpacing.setVerticalSpace(8),
          if (isSuccessful)
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'You have withdrawn',
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.fontSize,
                  color: const Color(0xFF808285),
                ),
                children: [
                  TextSpan(
                    text: ' NGN $message ',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.fontSize,
                      color: const Color(0xFF808285),
                    ),
                  ),
                  const TextSpan(
                    text: 'to your bank account',
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Text(
                'Your withdrawal cannot be processed at'
                ' this time. $message',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.fontSize,
                  color: const Color(0xFF505050),
                ),
              ),
            ),
          AppSpacing.setVerticalSpace(40),
          Button(
            onPressed: () => isSuccessful
                ? context.navigator.replaceAll(
                    const [
                      MainRoute(
                        children: [
                          WalletRoute(),
                        ],
                      ),
                    ],
                  )
                : Navigator.of(context).pop(),
            text: isSuccessful ? 'Done' : 'Back to wallet',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/onboarding_questionnaire_page.dart';
import 'package:hr56_staff/src/shared/button.dart';

class AuthCongratulationsPage extends StatelessWidget {
  const AuthCongratulationsPage({super.key});

  static const routeName = 'auth-congratulations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssetPath.personalInfoSuccess,
              width: 259.radius,
              height: 259.radius,
              fit: BoxFit.cover,
            ),
            AppSpacing.setVerticalSpace(32),
            Text(
              'Congratulations you are part of the team now, please '
              'complete your onboarding process by filling out these forms.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 15.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppSpacing.setVerticalSpace(40),
            Button(
              onPressed: () => context.navigator
                  .pushNamed(OnboardingQuestionnairePage.routeName),
              text: 'Start onboarding',
              suffixIcon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

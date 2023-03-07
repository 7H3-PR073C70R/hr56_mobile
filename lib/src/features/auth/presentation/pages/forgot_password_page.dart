import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_view.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return AuthView(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.setVerticalSpace(25),
            const AppBackButton(),
            AppSpacing.setVerticalSpace(30),
            Text(
              'Forgot Password',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 24.fontSize,
                color: AppColors.greenColor,
              ),
            ),
            AppSpacing.setVerticalSpace(5),
            Text(
              'Enter your password to continue',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            AppSpacing.setVerticalSpace(30),
            const AuthInputField(
              label: 'Email',
              hintText: 'name@example.com',
            ),
            AppSpacing.setVerticalSpace(40),
            Button(
              onPressed: () {
                showDialog<Widget>(
                  context: context,
                  builder: (ctx) => CustomDialog(
                    title: 'Reset Password',
                    description:
                        'Kindly check your mail, we’ve sent you a code to'
                        ' reset your password ',
                    actionText: 'Enter Code',
                    onActionPressed: () {
                      Navigator.of(ctx).pop();
                      context.navigator.pushNamed(ResetPasswordPage.routeName);
                    },
                  ),
                );
              },
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}

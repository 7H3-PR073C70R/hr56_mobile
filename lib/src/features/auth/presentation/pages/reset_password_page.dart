import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_view.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/password_validator_builder.dart';
import 'package:hr56_staff/src/shared/app_back_button.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';
import 'package:hr56_staff/src/shared/password_suffix_icon.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  static const routeName = 'reset-password';

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final password = useState('');
    final obscure = useState(true);

    passwordController.addListener(
      () => password.value = passwordController.text,
    );

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
              'Reset  Password',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 24.fontSize,
                color: AppColors.greenColor,
              ),
            ),
            AppSpacing.setVerticalSpace(5),
            Text(
              'Enter your email to receive reset code',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            AppSpacing.setVerticalSpace(30),
            Column(
              children: [
                AuthInputField(
                  label: 'Enter Code',
                  hintText: 'Enter code',
                  controller: emailController,
                  validator: context.validateEmailAddress,
                ),
                AppSpacing.setVerticalSpace(20),
                AuthInputField(
                  label: 'New Password',
                  hintText: '***********',
                  obscureText: obscure.value,
                  validator: context.validatePassword,
                  controller: passwordController,
                  suffixIcon: PasswordSuffixIcon(obscure: obscure),
                ),
                AppSpacing.setVerticalSpace(20),
                AuthInputField(
                  label: 'Retype new Password',
                  hintText: '***********',
                  obscureText: obscure.value,
                  controller: confirmPasswordController,
                  suffixIcon: PasswordSuffixIcon(obscure: obscure),
                ),
              ],
            ),
            AppSpacing.setVerticalSpace(10),
            PasswordValidatorBuilder(
              password: password.value,
            ),
            AppSpacing.setVerticalSpace(42),
            Button(
              onPressed: () {
                showDialog<Widget>(
                  context: context,
                  builder: (ctx) => CustomDialog(
                    title: 'Password Updated',
                    description: 'Password has been updated successfully',
                    actionText: 'Proceed to Login',
                    onActionPressed: () {
                      Navigator.of(ctx).pop();
                      context.navigator.popUntil(
                        (route) => route.settings.name == LoginRoute.name,
                      );
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

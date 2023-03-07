import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_view.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/password_validator_builder.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/main_page.dart';
import 'package:hr56_staff/src/shared/password_suffix_icon.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';
import 'package:hr56_staff/src/shared/widget_to_show.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final password = useState('');
    final obscure = useState(true);
    final isValidPassword = useState(true);

    passwordController.addListener(
      () => password.value = passwordController.text,
    );

    return WillPopScope(
      onWillPop: () async {
        if (isValidPassword.value) {
          return true;
        }
        isValidPassword.value = true;
        return false;
      },
      child: AuthView(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.setVerticalSpace(25),
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetToShow(
                    isValidPassword: isValidPassword.value,
                    secondChild: Text(
                      'Welcome Tobi Hassan, 👋',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 24.fontSize,
                        color: AppColors.greenColor,
                      ),
                    ),
                    child: Text(
                      'Welcome 👋',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 36.fontSize,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ),
                  WidgetToShow(
                    isValidPassword: isValidPassword.value,
                    secondChild: Text(
                      'Enter your password to continue',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    child: Text(
                      'Please login to your account',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.setVerticalSpace(60),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetToShow(
                            isValidPassword: isValidPassword.value,
                            child: Column(
                              children: [
                                AuthInputField(
                                  hintText: 'name@example.com',
                                  label: 'Email',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: context.validateEmailAddress,
                                ),
                                AppSpacing.setVerticalSpace(20),
                              ],
                            ),
                          ),
                          AuthInputField(
                            hintText: '***********',
                            label: 'Password',
                            obscureText: obscure.value,
                            controller: passwordController,
                            validator: context.validatePassword,
                            suffixIcon: PasswordSuffixIcon(obscure: obscure),
                          ),
                        ],
                      ),
                      AppSpacing.verticalSpaceSmall,
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => context.navigator.pushNamed(
                            ForgotPasswordPage.routeName,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 12.fontSize,
                              color: AppColors.greenColor,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.setVerticalSpace(10),
                      PasswordValidatorBuilder(
                        password: password.value,
                      ),
                      AppSpacing.setVerticalSpace(42),
                      Button(
                        onPressed: () {
                          if (isValidPassword.value) {
                            isValidPassword.value = false;
                            passwordController.clear();
                          } else {
                            context.navigator.pushNamed(MainPage.routeName);
                          }
                        },
                        text: 'Sign in',
                      ),
                      AppSpacing.setVerticalSpace(48),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                width: double.infinity,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            AppSpacing.setHorizontalSpace(12),
                            Text(
                              'Or',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 12.fontSize,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            AppSpacing.setHorizontalSpace(12),
                            Expanded(
                              child: Container(
                                height: 2,
                                width: double.infinity,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.setVerticalSpace(33),
                      const Center(
                        child: SvgImageAsset(AppAssetPath.faceScan),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

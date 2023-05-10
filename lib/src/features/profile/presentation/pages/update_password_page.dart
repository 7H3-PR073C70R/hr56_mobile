import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  static const routeName = 'update-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(
              text: 'Update password',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.setVerticalSpace(50),
                    Text(
                      'Update Password',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                    AppSpacing.setVerticalSpace(3),
                    Text(
                      'Ensure your account is using a long, random\npassword'
                      ' to stay secure.',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 12.fontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF383838),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(23),
                    const AuthInputField(
                      label: 'Current Password',
                      hintText: '***********',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    AppSpacing.setVerticalSpace(23),
                    const AuthInputField(
                      label: 'New Password',
                      hintText: '***********',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    AppSpacing.setVerticalSpace(23),
                    const AuthInputField(
                      label: 'Confirm Password',
                      hintText: '***********',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    AppSpacing.setVerticalSpace(51),
                    Button(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Update password',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/auth/presentation/pages/login_page.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/button.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);
    final pageController = usePageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withOpacity(.7),
        elevation: 0,
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ColoredBox(
        color: AppColors.primaryColor.withOpacity(.7),
        child: Column(
          children: [
            AppSpacing.setVerticalSpace(37),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 8.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.radius),
                child: LinearProgressIndicator(
                  value: (pageIndex.value + 1) / 3,
                  backgroundColor: const Color(0xFFEDEFF0),
                  color: AppColors.successColor,
                ),
              ),
            ),
            AppSpacing.setVerticalSpace(76),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: pageController,
                onPageChanged: (index) => pageIndex.value = index,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: AppSpacing.screenHeight(context) * .4,
                        child: Column(
                          children: [
                            Expanded(
                              child: pageIndex.value == 2
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 85.height),
                                            child: Image.asset(
                                              AppAssetPath.onboarding31,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 55.height,
                                            ),
                                            child: Image.asset(
                                              AppAssetPath.onboarding32,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Image.asset(
                                      pageIndex.value == 0
                                          ? AppStrings.onboardingImages[0]
                                          : AppStrings.onboardingImages[1],
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.whiteColor,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 28,
                            bottom: 31,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppStrings.onboardingTitle[index],
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 20.fontSize,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.successColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.setVerticalSpace(12),
                              Text(
                                " it's important to gather all necessary"
                                ' documentation, such as proof of income and '
                                'employment, and to have a clear understanding '
                                'of your financial goals',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 12.5.fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF5C6771),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 28,
                                  bottom: 31,
                                ),
                                child: Column(
                                  children: [
                                    Button(
                                      onPressed: () {
                                        if (pageIndex.value == 2) {
                                          locator<UserStorageService>()
                                              .saveCompletedOnboarding();
                                          context.navigator.replaceNamed(
                                            LoginPage.routeName,
                                          );
                                        } else {
                                          pageController.nextPage(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeIn,
                                          );
                                        }
                                      },
                                      text: 'NEXT',
                                    ),
                                    AppSpacing.setVerticalSpace(25),
                                    RichText(
                                      text: TextSpan(
                                        text: 'By continue, you’re  agree to ',
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 12.fontSize,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'HR56',
                                            style: TextStyle(
                                              color: AppColors.successColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppSpacing.setVerticalSpace(4),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Privacy policy ',
                                        style: context.textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 12.fontSize,
                                          color: AppColors.successColor,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'and ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textColor,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Terms of use.',
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

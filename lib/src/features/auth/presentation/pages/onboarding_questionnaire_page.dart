import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/bank_details_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/emergency_contact_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/guarantor_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/id_photo_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/next_of_kin_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/personal_info_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/reference_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/spouse_details_page.dart';

class OnboardingQuestionnairePage extends HookWidget {
  const OnboardingQuestionnairePage({super.key});

  static const routeName = 'onboarding-question';

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final pageIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: AppColors.primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          OnboardingQuestionnaireHeader(
            key: UniqueKey(),
          ),
          AppSpacing.setVerticalSpace(28),
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) => pageIndex.value = value,
              itemCount: 8,
              itemBuilder: (context, index) => [
                PersonalInfoPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                SpouseDetailsPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                NextOfKinPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                BankDetailsPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                GuarantorPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                EmergencyContactPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                ReferencePage(
                  isAfterLogin: true,
                  controller: controller,
                ),
                IDPhotoPage(
                  isAfterLogin: true,
                  controller: controller,
                ),
              ].elementAt(pageIndex.value),
            ),
          ),
          AppSpacing.setVerticalSpace(15),
        ],
      ),
    );
  }
}

class OnboardingQuestionnaireHeader extends StatelessWidget {
  const OnboardingQuestionnaireHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.primaryColor,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 53.radius,
                backgroundColor: AppColors.greyColor,
                backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q='
                  'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3hWiW-pUQDnb&s',
                ),
              ),
              Positioned(
                top: 64.height,
                left: 77.width,
                child: CircleAvatar(
                  radius: 19.5.radius,
                  backgroundColor: AppColors.whiteColor,
                  child: Center(
                    child: CircleAvatar(
                      radius: 14.radius,
                      backgroundColor: AppColors.greenColor,
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.setHorizontalSpace(26),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Isaiah Nwankwo',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 20.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
                AppSpacing.setVerticalSpace(3),
                Text(
                  'Isaiahnwankwo@gmail.com',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 15.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
                AppSpacing.setVerticalSpace(3),
                Text(
                  'Bridgegap Consults Limited',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 12.fontSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFB5BCBF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

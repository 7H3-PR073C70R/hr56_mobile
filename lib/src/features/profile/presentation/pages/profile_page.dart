import 'package:flutter/material.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/bank_details_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/emergency_contact_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/guarantor_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/next_of_kin_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/personal_info_page.dart';
import 'package:hr56_staff/src/features/profile/presentation/pages/reference_page.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/profile_info.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.backgroundColor,
        isDark: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfo(
                    onEditTap: () => context.navigator.pushNamed(
                      PersonalInfoPage.routeName,
                    ),
                    header: 'Personal Info',
                    titles: const [
                      'Employee ID',
                      'Employment type',
                      'Job title',
                      'Phone number',
                      'Phone number 2',
                      'Date of birth',
                      'Gender',
                      'Marital status',
                      'Home address',
                      'State of residence',
                      'Spouse name',
                      'Spouse phone number',
                      'Spouse address',
                    ],
                    descriptions: const [
                      '2012ASG',
                      'Full time',
                      'Lead Designer',
                      '090958545888',
                      '0707585757454',
                      '25/06/1993',
                      'Male',
                      'Single',
                      '23 Finance quarters, Kubwa, Abuja.',
                      'Abuja',
                      'N/A',
                      'N/A',
                      'N/A',
                    ],
                  ),
                  ProfileInfo(
                    descriptions: const [
                      'Tobi',
                      'Hassan',
                      '0810467748448',
                      'Phase 2 VI, Lagos state',
                    ],
                    titles: const [
                      'First Name',
                      'Last Name',
                      'Phone Number',
                      'Address',
                    ],
                    onEditTap: () => context.navigator.pushNamed(
                      NextOfKinPage.routeName,
                    ),
                    header: 'Next of Kin',
                  ),
                  ProfileInfo(
                    descriptions: const [
                      'Access bank',
                      '026364738',
                      'Isaiah Nwankwo',
                      '414676766879990',
                    ],
                    titles: const [
                      'Bank name',
                      'Bank account number',
                      'Bank account name',
                      'National identity number',
                    ],
                    onEditTap: () => context.navigator.pushNamed(
                      BankDetailsPage.routeName,
                    ),
                    header: 'Bank Details',
                  ),
                  ProfileInfo(
                    descriptions: const [
                      'Tobi',
                      'Hassan',
                      'Tobihassan@gmail.com',
                    ],
                    titles: const [
                      'First name',
                      'Last name',
                      'Email',
                    ],
                    onEditTap: () => context.navigator.pushNamed(
                      GuarantorPage.routeName,
                    ),
                    header: 'Guarantor Details',
                  ),
                  ProfileInfo(
                    descriptions: const [
                      'Tobi',
                      '09056637373',
                    ],
                    titles: const [
                      'Name',
                      'Phone number',
                    ],
                    onEditTap: () => context.navigator.pushNamed(
                      EmergencyContactPage.routeName,
                    ),
                    header: 'Emergency Contact',
                  ),
                  ProfileInfo(
                    descriptions: const [
                      'Tobi Hassan',
                      'Tobihassan@gmail.com',
                      'Somewhere on earth, Lagos',
                      '09056637373',
                      'Project manager',
                      'Microsoft',
                      'Design',
                      '8/03/2023',
                      'N/A',
                      'N/A',
                    ],
                    titles: const [
                      'Name',
                      'Email',
                      'Address',
                      'Phone number',
                      'Job role',
                      'Company name',
                      'Job department',
                      'Employment start date',
                      'Employment end date',
                      'Exit reason',
                    ],
                    onEditTap: () => context.navigator.pushNamed(
                      ReferencePage.routeName,
                    ),
                    header: 'References',
                    showLine: false,
                  ),
                  AppSpacing.setVerticalSpace(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              AppSpacing.setVerticalSpace(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Isaiah Nwankwo',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 24.fontSize,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        AppSpacing.setVerticalSpace(2),
                        Text(
                          'Isaiahnwankwo@gmail.com',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        AppSpacing.setVerticalSpace(2),
                        Text(
                          'Bridgegap Consults Limited',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        AppSpacing.setVerticalSpace(24),
                        Text(
                          '${AppStrings.naira}300,000',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.navigator.pushNamed(
                      PersonalInfoRoute.name,
                    ),
                    child: const SvgImageAsset(AppAssetPath.edit),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacing.setVerticalSpace(22),
        Container(
          height: 8.height,
          width: double.infinity,
          color: AppColors.whiteColor,
        ),
      ],
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars, no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/main_page.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class IDPhotoPage extends HookWidget {
  const IDPhotoPage({
    super.key,
    this.isAfterLogin = false,
    this.controller,
  });

  final bool isAfterLogin;
  final PageController? controller;

  static const routeName = 'id-photo';

  @override
  Widget build(BuildContext context) {
    final isTaken = useState(false);
    final isReview = useState(false);
    return WillPopScope(
      onWillPop: () async {
        if (isReview.value) {
          isReview.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: const EmptyAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBarWithBackButton(
                text: 'ID card application',
                onNavigateBack: controller == null
                    ? null
                    : () => UserInformation.personal.navigateBack(controller!),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedCrossFade(
                        firstChild: IDInfoView(isTaken: isTaken),
                        secondChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.setVerticalSpace(51),
                            Text(
                              'Front section',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(12),
                            const IDCardFront(),
                            AppSpacing.setVerticalSpace(30),
                            Text(
                              'Back section',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 16.fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(18),
                            const IDCardBack(),
                          ],
                        ),
                        crossFadeState: isReview.value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      ),
                      AppSpacing.setVerticalSpace(30),
                      Button(
                        onPressed: () {
                          if (isTaken.value) {
                            if (isReview.value) {
                              if (isReview.value) {
                                if (isAfterLogin) {
                                  showModalBottomSheet<Widget>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.radius),
                                        topRight: Radius.circular(25.radius),
                                      ),
                                    ),
                                    context: context,
                                    builder: (_) =>
                                        const IDPhotoSuccessDialog(),
                                  );
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                              return;
                            }
                            isReview.value = true;
                            return;
                          }
                          isTaken.value = true;
                        },
                        text: isReview.value
                            ? isAfterLogin
                                ? 'Complete onboarding'
                                : 'Complete'
                            : isTaken.value
                                ? 'Preview ID card'
                                : 'Take photo',
                      ),
                      AppSpacing.setVerticalSpace(30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IDCardBack extends StatelessWidget {
  const IDCardBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IDCardBG(
      card: Positioned(
        top: 75.17.height,
        child: SizedBox(
          width: 340.width,
          child: Column(
            children: [
              const SvgImageAsset(AppAssetPath.logoSvg),
              AppSpacing.setVerticalSpace(15),
              Text(
                '56Bridge',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 23.16.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'TAG LINE GOES HERE',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 13.25.fontSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenColor,
                ),
              ),
              AppSpacing.setVerticalSpace(21),
              ...[
                'Lorem ipsum dolor sit amet, consectetur adipicing elit,'
                    ' sad diam noumea nibh euismod.',
                'Lorem ipsum dolor sit amet, consectetur adipicing elit, sad diam noumea nibh euismod.',
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 14.94,
                        right: 29.24,
                        left: 26.5,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4.radius,
                            ),
                            child: CircleAvatar(
                              radius: 3.radius,
                              backgroundColor: const Color(
                                0xFFF39101,
                              ),
                            ),
                          ),
                          AppSpacing.setHorizontalSpace(15),
                          Expanded(
                            child: Text(
                              e,
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 13.25.fontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              const RowText(
                padding: 26.5,
                title: 'Join:',
                description: '23-6-2020',
              ),
              AppSpacing.setVerticalSpace(3),
              const RowText(
                padding: 26.5,
                title: 'Expire:',
                description: '22-6-2025',
              ),
              AppSpacing.setVerticalSpace(31.9),
              Image.network(
                'https://static.vecteezy.com/system/'
                'resources/previews/001/199/360/original/barcode-png.png',
                height: 28.84.height,
                width: 241.18.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IDCardFront extends StatelessWidget {
  const IDCardFront({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IDCardBG(
      card: Positioned(
        top: 64.92.height,
        child: SizedBox(
          width: 340.width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 98.13.radius,
                  width: 98.13.radius,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q='
                        'tbn:ANd9GcTmrssFdAIAer1QHQ40q2y'
                        'GBcAYrjbw3hWiW-pUQDnb&s',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppSpacing.setVerticalSpace(25),
                Text(
                  'Isaiah Nwankwo',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 26.29.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                Text(
                  'DESIGNER',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 16.43.fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greenColor,
                  ),
                ),
                AppSpacing.setVerticalSpace(26.77),
                const RowText(
                  title: 'Employee ID:',
                  description: 'SFR1234',
                ),
                AppSpacing.verticalSpaceSmall,
                const RowText(
                  title: 'E-mail:',
                  description: 'email@yourdomain.com',
                ),
                AppSpacing.setVerticalSpace(68),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    20,
                    (index) => Container(
                      height: 1,
                      width: 10.width,
                      color: AppColors.blackColor,
                      margin: const EdgeInsets.only(left: 1),
                    ),
                  ),
                ),
                AppSpacing.verticalSpaceTiny,
                Text(
                  'Your Signature',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 21.14.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.title,
    required this.description,
    this.padding = 61.9,
  });

  final String title;
  final String description;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 83.width,
            child: Text(
              title,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 13.14.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AppSpacing.horizontalSpaceSmall,
          Expanded(
            child: Text(
              description,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 13.14.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IDPhotoSuccessDialog extends StatelessWidget {
  const IDPhotoSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.setVerticalSpace(12),
          Container(
            height: 7.height,
            width: 71.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.radius),
              color: const Color(0xFFE6E5E4),
            ),
          ),
          AppSpacing.setVerticalSpace(50),
          Center(
            child: SizedBox(
              height: 165.height,
              width: 165.width,
              child: Image.asset(
                AppAssetPath.personalInfoSuccess,
                height: 255.height,
                width: 255.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppSpacing.setVerticalSpace(25),
          Text(
            'Staff details Saved',
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 20.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSpacing.setVerticalSpace(12),
          Text(
            'Staff details has been successfully '
            'saved you can always update them on'
            ' your profile  ',
            textAlign: TextAlign.center,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 15.fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF3E4F59),
            ),
          ),
          AppSpacing.setVerticalSpace(42),
          Button(
            onPressed: () => context.navigator.replaceNamed(MainPage.routeName),
            text: 'Home page',
          ),
          AppSpacing.setVerticalSpace(25),
        ],
      ),
    );
  }
}

class IDCardBG extends StatelessWidget {
  const IDCardBG({
    super.key,
    required this.card,
  });

  final Widget card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 529.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.radius),
      ),
      child: Stack(
        children: [
          const Column(
            children: [
              SvgImageAsset(AppAssetPath.idTop),
              Spacer(),
              SvgImageAsset(AppAssetPath.idBottom),
            ],
          ),
          card,
        ],
      ),
    );
  }
}

class IDInfoView extends StatelessWidget {
  const IDInfoView({
    super.key,
    required this.isTaken,
  });

  final ValueNotifier<bool> isTaken;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.setVerticalSpace(36),
        Container(
          height: 264.height,
          width: 272.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.radius),
            color: AppColors.blackColor.withOpacity(.2),
            image: isTaken.value
                ? const DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q='
                      'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3'
                      'hWiW-pUQDnb&s',
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        AppSpacing.setVerticalSpace(36),
        const InfoText(
          title: 'First name:',
          text: 'Isaiah',
        ),
        AppSpacing.setVerticalSpace(24),
        const InfoText(
          title: 'Last name:',
          text: 'Nwankwo',
        ),
        AppSpacing.setVerticalSpace(24),
        const InfoText(
          title: 'Employee ID:',
          text: 'SFR1234',
        ),
        AppSpacing.setVerticalSpace(24),
        const InfoText(
          title: 'Job title:',
          text: 'Product designer',
        ),
      ],
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 20.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 20.fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

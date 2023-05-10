import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/home/presentation/pages/notification_page.dart';
import 'package:hr56_staff/src/shared/carousel_indicator.dart';
import 'package:hr56_staff/src/shared/custom_drawer.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const EmptyAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.setVerticalSpace(20),
                  HomeHeader(
                    openDrawer: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  AppSpacing.setVerticalSpace(16),
                  const HomeCardBuilder(),
                  // AppSpacing.setVerticalSpace(30),
                  // Text(
                  //   'Payroll history',
                  //   style: context.textTheme.displayLarge?.copyWith(
                  //     fontSize: 20.fontSize,
                  //   ),
                  // ),
                  // AppSpacing.setVerticalSpace(7),
                ],
              ),
            ),
            AppSpacing.setVerticalSpace(40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.radius),
                color: const Color(0xFFF1CFFA).withOpacity(.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 71.radius,
                    backgroundImage:
                        const NetworkImage(AppStrings.profileImage),
                  ),
                  AppSpacing.verticalSpaceMedium,
                  Text(
                    'Isaiah Nwankwo',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 20.fontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF56006B),
                    ),
                  ),
                  AppSpacing.verticalSpaceTiny,
                  Text(
                    'Isaiahnwankwo@gmail.com',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF944DA6),
                    ),
                  ),
                  AppSpacing.verticalSpaceTiny,
                  Text(
                    'Bridgegap Consults',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF944DA6),
                    ),
                  ),
                  AppSpacing.verticalSpaceTiny,
                  Text(
                    '+234 705 654 1234',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF944DA6),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (context, _) => const PayrollHistoryCard(
            //       amount: '270,000',
            //       date: 'January 30, 2023',
            //       info: 'BGSALR / 20230200150',
            //     ),
            //   ),
            // ),
            // AppSpacing.setVerticalSpace(22),
            // SizedBox(
            //   height: 156.height,
            //   width: double.infinity,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => Container(
            //       height: 156.height,
            //       padding: EdgeInsets.all(11.radius),
            //       margin: const EdgeInsets.only(right: 12),
            //       width: 300.width,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8.radius),
            //         color: [
            //           const Color(0xFF3CA643),
            //           const Color(0xFF0671E0),
            //           const Color(0xFF911294),
            //         ][index % 3],
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Up to 30% free',
            //             style: context.textTheme.displayLarge?.copyWith(
            //               fontWeight: FontWeight.w600,
            //               fontSize: 20.fontSize,
            //               color: const Color(0xFFFECB16),
            //             ),
            //           ),
            //           Expanded(
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         'Chevron free energy bill...',
            //                         style: context.textTheme.displayLarge
            //                             ?.copyWith(
            //                           fontWeight: FontWeight.w600,
            //                           fontSize: 20.fontSize,
            //                           color: AppColors.whiteColor,
            //                         ),
            //                       ),
            //                       AppSpacing.setVerticalSpace(11),
            //                       Button(
            //                         onPressed: () {},
            //                         text: 'Read More',
            //                         width: 104,
            //                         height: 30,
            //                         radius: 8,
            //                         backgroundColor: AppColors.whiteColor,
            //                         textColor: AppColors.textColor,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Image.network(
            //                     'https://encrypted-tbn0.gstatic.com/images?q='
            //                     'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw'
            //                     '3hWiW-pUQDnb&s',
            //                     fit: BoxFit.cover,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // AppSpacing.setVerticalSpace(22),
          ],
        ),
      ),
    );
  }
}

class HomeCardBuilder extends HookWidget {
  const HomeCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentCarouselSliderIndex = useState(0);
    return Column(
      children: [
        SizedBox(
          height: 137.height,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (context, index, _) {
              return HomeInfoCard(
                isLoan: index.isEven,
                value: '23',
              );
            },
            options: CarouselOptions(
              viewportFraction: .9,
              onPageChanged: (index, _) {
                currentCarouselSliderIndex.value = index;
              },
            ),
          ),
        ),
        AppSpacing.verticalSpaceMedium,
        CarouselIndicator(
          length: 2,
          currentIndex: currentCarouselSliderIndex.value,
        ),
      ],
    );
  }
}

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({
    super.key,
    required this.isLoan,
    required this.value,
  });

  final bool isLoan;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.height,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.radius),
        color: isLoan ? AppColors.primaryColor : const Color(0xFF02C55C),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 75.height,
            child: const SvgImageAsset(
              AppAssetPath.homeCardBg1,
            ),
          ),
          Positioned(
            left: 221.width,
            child: const SvgImageAsset(
              AppAssetPath.homeCardBg2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 29,
              left: 13,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 62.height,
                  width: 68.width,
                  padding: EdgeInsets.all(4.radius),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.radius),
                    color: isLoan
                        ? const Color(0xFFEABAF6)
                        : const Color(0xFFCAF8DF).withOpacity(.5),
                  ),
                  child: Container(
                    height: 54.height,
                    width: 59.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.radius),
                      color: AppColors.whiteColor,
                    ),
                    child: SvgImageAsset(
                      isLoan ? AppAssetPath.loanRequest : AppAssetPath.receipt,
                    ),
                  ),
                ),
                AppSpacing.setHorizontalSpace(18),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 40.fontSize,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        isLoan ? 'Loan Requests' : 'Payroll',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 24.fontSize,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
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

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.openDrawer,
  });

  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: openDrawer,
            behavior: HitTestBehavior.opaque,
            child: const SvgImageAsset(AppAssetPath.drawer),
            // CircleAvatar(
            //   radius: 25.radius,
            //   backgroundColor: AppColors.greyColor,
            //   backgroundImage: const NetworkImage(
            //     'https://encrypted-tbn0.gstatic.com/images?q='
            //     'tbn:ANd9GcTmrssFdAIAer1QHQ40q2yGBcAYrjbw3hWiW-pUQDnb&s',
            //   ),
            // ),
          ),
          AppSpacing.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Isaiah Nwankwo',
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 16.fontSize,
                  ),
                ),
                AppSpacing.setHorizontalSpace(2),
                Text(
                  'Bridgegap Consults',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 11.fontSize,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.horizontalSpaceMassive,
          GestureDetector(
            onTap: () =>
                context.navigator.pushNamed(NotificationPage.routeName),
            child: const SvgImageAsset(AppAssetPath.notification),
          ),
        ],
      ),
    );
  }
}

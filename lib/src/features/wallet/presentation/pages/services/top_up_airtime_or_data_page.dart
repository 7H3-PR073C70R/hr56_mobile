import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class TopUpAirtimeOrDataPage extends HookWidget {
  const TopUpAirtimeOrDataPage({
    super.key,
    this.isAirtime = true,
  });

  static const routeName = 'top-up-airtime-or-data';

  final bool isAirtime;

  @override
  Widget build(BuildContext context) {
    final phoneNumber = useTextEditingController();
    final hasPhoneNumber = useState(false);
    final selectedNetwork = useState<NetworkProvider?>(NetworkProvider.glo);
    phoneNumber.addListener(() {
      hasPhoneNumber.value = phoneNumber.text.length == 11;
    });
    final tabIndex = useState(
      0,
    );
    final amountController = useTextEditingController();
    final selectedBillerIndex = useState(-1);
    final tabScrollController = useScrollController();
    return Scaffold(
      appBar: const EmptyAppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: Column(
          children: [
            CustomAppBarWithBackButton(
              text: isAirtime ? 'Top up Airtime' : 'Buy Data Bundles',
            ),
            AppSpacing.setVerticalSpace(37),
            _NetworkProviderSelectorCard(
              selectedNetwork: selectedNetwork,
            ),
            AppSpacing.setVerticalSpace(20),
            CustomInputField(
              prefixIcon: const UnconstrainedBox(
                child: SvgImageAsset(
                  AppAssetPath.glo,
                ),
              ),
              controller: phoneNumber,
              hintText: 'Enter a phone number',
              maxLength: 11,
            ),
            AppSpacing.setVerticalSpace(21),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: double.infinity,
              padding: EdgeInsets.all(12.radius),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.radius,
                ),
                border: Border.all(
                  color: const Color(0xFFCCCCCC),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.height,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: tabScrollController,
                      separatorBuilder: (_, __) =>
                          AppSpacing.setHorizontalSpace(12),
                      itemCount: 1,
                      itemBuilder: (context, index) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          tabIndex.value = index;
                          selectedBillerIndex.value = -1;
                          tabScrollController.animateTo(
                            (index * 60).toDouble(),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.radius,
                            vertical: 3.radius,
                          ),
                          alignment: Alignment.center,
                          decoration: tabIndex.value == index
                              ? BoxDecoration(
                                  color: const Color(0xFFAD00D7)
                                      .withOpacity(.06),
                                  border: Border.all(
                                    color: const Color(0xFFAD00D7),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30.radius,
                                  ),
                                )
                              : null,
                          child: Text(
                            [
                              '🔥 Top up',
                            ].elementAt(index),
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 16.fontSize,
                              fontWeight: FontWeight.w500,
                              color: tabIndex.value == index
                                  ? const Color(0xFFAC00D7)
                                  : const Color(0xFF808080),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(16),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.width,
                      mainAxisSpacing: 8.height,
                      childAspectRatio: isAirtime ? 1.3 : 0.8,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        selectedBillerIndex.value = index;
                        if (isAirtime) {
                          amountController.text = [
                            '50',
                            '100',
                            '200',
                            '500',
                            '1,000',
                            '2,000',
                          ].elementAt(index);
                        }
                      },
                      child: Container(
                        height: 56.height,
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.radius,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedBillerIndex.value == index
                                ? const Color(0xFFAD00D7)
                                : const Color(0xFFCCCCCC),
                          ),
                          color: selectedBillerIndex.value == index
                              ? const Color(0xFFAD00D7).withOpacity(.06)
                              : null,
                          borderRadius: BorderRadius.circular(
                            10.radius,
                          ),
                        ),
                        child: isAirtime
                            ? RichText(
                                text: TextSpan(
                                  text: 'N',
                                  style: context.textTheme.displayLarge
                                      ?.copyWith(
                                    fontSize: 15.fontSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: [
                                        '50',
                                        '100',
                                        '200',
                                        '500',
                                        '1,000',
                                        '2,000',
                                      ].elementAt(index),
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 24.fontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.all(11.radius),
                                child: Column(
                                  children: [
                                    Text(
                                      '1 Day',
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 14.fontSize,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFAB02F8),
                                      ),
                                    ),
                                    AppSpacing.verticalSpaceSmall,
                                    RichText(
                                      text: TextSpan(
                                        text: '500',
                                        style: context
                                            .textTheme.displayLarge
                                            ?.copyWith(
                                          fontSize: 20.fontSize,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'MB',
                                            style: context
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontSize: 12.fontSize,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      [
                                        'N 50',
                                        'N 100',
                                        'N 200',
                                        'N 500',
                                        'N 1,000',
                                        'N 2,000',
                                      ].elementAt(index),
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 13.fontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isAirtime) ...[
              AppSpacing.setVerticalSpace(21),
              CustomInputField(
                label: 'Enter amount',
                hintText: 'N 50- 50,000',
                controller: amountController,
              ),
            ],
            AppSpacing.setVerticalSpace(41),
            Button(
              enable: hasPhoneNumber.value && selectedNetwork.value != null,
              onPressed: () => showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                enableDrag: false,
                isDismissible: false,
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.radius),
                  ),
                ),
                builder: (_) => _PaymentSummary(
                  isAirtime: isAirtime,
                ),
              ),
              text: 'Make payments',
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary({required this.isAirtime});
  final bool isAirtime;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.setVerticalSpace(14),
        Stack(
          children: [
            Center(
              child: Text(
                'Payment',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 20.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 25.radius),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  behavior: HitTestBehavior.translucent,
                  child: CircleAvatar(
                    radius: 12.radius,
                    backgroundColor: AppColors.blackColor,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                        size: 20.radius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.setVerticalSpace(14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.radius),
          child: Column(
            children: [
              Text(
                'N 2,000',
                style: context.textTheme.displayMedium?.copyWith(
                  fontSize: 32.fontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFBB00E9),
                ),
              ),
              AppSpacing.setVerticalSpace(27),
              Container(
                padding: EdgeInsets.all(10.radius),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.radius),
                  border: Border.all(
                    color: const Color(0xFFCCCCCC),
                  ),
                ),
                child: Column(
                  children: [
                    (text: 'Amount:', value: 'N 200'),
                    (text: 'Provider:', value: 'GLO'),
                    (text: 'Mobile Number:', value: '987654567890'),
                    if (!isAirtime)
                      (text: 'Bundle Details:', value: '2.5GB + 500MB Night'),
                  ]
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.text,
                                    style: context.textTheme.displayLarge
                                        ?.copyWith(
                                      fontSize: 14.fontSize,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF2B2B2B),
                                    ),
                                  ),
                                ),
                                AppSpacing.horizontalSpaceSmall,
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      e.value,
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 14.fontSize,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(
                                          0xFF2B2B2B,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppSpacing.setVerticalSpace(16),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              AppSpacing.setVerticalSpace(23),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.radius,
                  vertical: 16.radius,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.radius),
                  color: const Color(0xFFF9F9F9),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '567798765643',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 16.fontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppSpacing.verticalSpaceTiny,
                          Text(
                            'From Wallet Balance',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 14.fontSize,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF555555),
                            ),
                          ),
                          AppSpacing.verticalSpaceTiny,
                          Text(
                            'N 4,700',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 14.fontSize,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF555555),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'N 248,980.67',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.setVerticalSpace(35),
              Button(
                onPressed: () {},
                text: 'Confirm to pay',
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
        AppSpacing.setVerticalSpace(35),
      ],
    );
  }
}

class _NetworkProviderSelectorCard extends StatelessWidget {
  const _NetworkProviderSelectorCard({
    required this.selectedNetwork,
  });

  final ValueNotifier<NetworkProvider?> selectedNetwork;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.radius),
            ),
          ),
          builder: (_) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: AppSpacing.screenHeight(context) * .5,
              minWidth: double.infinity,
            ),
            child: _NetworkProviderSelectorModal(
              selectedNetwork: selectedNetwork,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 8.radius,
          vertical: 7.radius,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.radius,
          ),
          border: Border.all(
            color: const Color(0xFFCCCCCC),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: selectedNetwork.value == null
                  ? Text(
                      'Select a network provider',
                      style: context.theme.inputDecorationTheme.hintStyle,
                    )
                  : Row(
                      children: [
                        SvgImageAsset(
                          selectedNetwork.value!.assets,
                          height: 34.radius,
                          width: 34.radius,
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          selectedNetwork.value!.name,
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
            ),
            AppSpacing.horizontalSpaceMedium,
            Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFF1E222B),
              size: 32.radius,
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkProviderSelectorModal extends StatelessWidget {
  const _NetworkProviderSelectorModal({
    required this.selectedNetwork,
  });

  final ValueNotifier<NetworkProvider?> selectedNetwork;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.setVerticalSpace(16),
        Stack(
          children: [
            Center(
              child: Text(
                'Select Network Provider',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 20.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 25.radius),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  behavior: HitTestBehavior.translucent,
                  child: CircleAvatar(
                    radius: 12.radius,
                    backgroundColor: AppColors.primaryColor,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                        size: 20.radius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.setVerticalSpace(15),
        const Divider(
          height: 1,
          color: Color(0xFFCCCCCC),
        ),
        AppSpacing.setVerticalSpace(34),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.radius),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  selectedNetwork.value = NetworkProvider.values[index];
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    SvgImageAsset(
                      NetworkProvider.values[index].assets,
                    ),
                    AppSpacing.horizontalSpaceSmall,
                    Text(
                      NetworkProvider.values[index].name,
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, index) => AppSpacing.setVerticalSpace(36),
              itemCount: NetworkProvider.values.length,
            ),
          ),
        ),
      ],
    );
  }
}

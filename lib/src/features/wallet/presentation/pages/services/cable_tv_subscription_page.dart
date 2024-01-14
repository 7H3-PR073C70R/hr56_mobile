import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class CableTVSubscriptionPage extends HookWidget {
  const CableTVSubscriptionPage({super.key});

  static const routeName = 'cable-tv-subscription';

  @override
  Widget build(BuildContext context) {
    final saveSmartCard = useState(false);
    final tabIndex = useState(
      0,
    );
    final selectedBillerIndex = useState(-1);
    final tabScrollController = useScrollController();
    final selectedCableTv = useState<TvCable?>(null);
    final smartCardNumber = useTextEditingController();
    final hasSmartCardNumber = useState(false);

    smartCardNumber.addListener(() {
      hasSmartCardNumber.value = smartCardNumber.text.isNotEmpty;
    });
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
            const CustomAppBarWithBackButton(text: 'TV/ Cable payment'),
            AppSpacing.setVerticalSpace(37),
            Expanded(
              child: Column(
                children: [
                  _CableTvSelectorCard(
                    selectedCableTv: selectedCableTv,
                  ),
                  AppSpacing.setVerticalSpace(12),
                  Text(
                    'Enjoy N50-N200 coupons on your TV subscription'
                    ' every month',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppSpacing.setVerticalSpace(31),
                  CustomInputField(
                    hintText: 'Enter smart card number',
                    label: 'Enter Smart card Number',
                    controller: smartCardNumber,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Save smart card number',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 13.fontSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      AppSpacing.horizontalSpaceMedium,
                      SizedBox(
                        height: 23.height,
                        width: 45.width,
                        child: Switch.adaptive(
                          value: saveSmartCard.value,
                          onChanged: (value) => saveSmartCard.value = value,
                          activeColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.setVerticalSpace(21),
                  if (selectedCableTv.value != null) ...[
                    Expanded(
                      child: AnimatedContainer(
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
                                itemCount: 4,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    tabIndex.value = index;
                                    selectedBillerIndex.value = -1;
                                    tabScrollController.animateTo(
                                      (index * 60).toDouble(),
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                        '🔥 Best offers',
                                        '1 month',
                                        '2 months',
                                        '3 months',
                                      ].elementAt(index),
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
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
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.width,
                                  mainAxisSpacing: 8.height,
                                  childAspectRatio: 2.3,
                                ),
                                itemBuilder: (_, index) => GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    selectedBillerIndex.value = index;
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
                                        color:
                                            selectedBillerIndex.value == index
                                                ? const Color(0xFFAD00D7)
                                                : const Color(0xFFCCCCCC),
                                      ),
                                      color: selectedBillerIndex.value == index
                                          ? const Color(0xFFAD00D7)
                                              .withOpacity(.06)
                                          : null,
                                      borderRadius: BorderRadius.circular(
                                        10.radius,
                                      ),
                                    ),
                                    child: index.isEven
                                        ? RichText(
                                            text: TextSpan(
                                              text: 'Compact /',
                                              style: context
                                                  .textTheme.displayLarge
                                                  ?.copyWith(
                                                fontSize: 15.fontSize,
                                                fontWeight: FontWeight.w500,
                                                color: selectedBillerIndex
                                                            .value ==
                                                        index
                                                    ? const Color(0xFFB40FDC)
                                                    : null,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' Month\n',
                                                  style: context
                                                      .textTheme.displayLarge
                                                      ?.copyWith(
                                                    fontSize: 14.fontSize,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: 'N 10,500',
                                                ),
                                              ],
                                            ),
                                          )
                                        : Text(
                                            'Premium+ XtraView\nN 10,500',
                                            style: context
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontSize: 15.fontSize,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  selectedBillerIndex.value ==
                                                          index
                                                      ? const Color(0xFFB40FDC)
                                                      : null,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(25),
                    Button(
                      enable: selectedCableTv.value != null &&
                          selectedBillerIndex.value != -1 &&
                          hasSmartCardNumber.value,
                      onPressed: () => showDialog<dynamic>(
                        context: context,
                        builder: (_) => _BuyTVCableDialog(
                          selectedCableType: selectedCableTv.value!.name,
                          selectedSubscriptionType:
                              selectedBillerIndex.value.isEven
                                  ? 'Compact / month'
                                  : 'Premium+ XtraView',
                          smartCardNumber: smartCardNumber.text,
                          amount: 'N10,500',
                        ),
                      ),
                      text: 'Make payments',
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ],
                  AppSpacing.setVerticalSpace(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyTVCableDialog extends StatelessWidget {
  const _BuyTVCableDialog({
    required this.selectedCableType,
    required this.selectedSubscriptionType,
    required this.smartCardNumber,
    required this.amount,
  });

  final String selectedCableType;
  final String selectedSubscriptionType;
  final String smartCardNumber;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.radius),
      ),
      backgroundColor: AppColors.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 22.radius),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.radius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             
            Container(
              height: 95.height,
              width: double.infinity,
              color: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 16.radius,
                vertical: 10.radius,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSpacing.setVerticalSpace(4),
                        Text(
                          'Your Choice ',
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        AppSpacing.setVerticalSpace(5),
                        RichText(
                          text: TextSpan(
                            text: 'Compact ',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 16.fontSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                            children: [
                              TextSpan(
                                text: ' / Month\n',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 13.fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              TextSpan(
                                text: 'N 10,500',
                                style: TextStyle(fontSize: 20.fontSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.horizontalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      behavior: HitTestBehavior.translucent,
                      child: CircleAvatar(
                        radius: 12.radius,
                        backgroundColor: AppColors.whiteColor,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: AppColors.primaryColor,
                            size: 20.radius,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.setVerticalSpace(23),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.radius,
                vertical: 10.radius,
              ),
              child: Column(
                children: [
                  ...[
                    (text: 'Smart card number:', value: smartCardNumber),
                    (
                      text: 'Subscription type:',
                      value: selectedSubscriptionType
                    ),
                    (text: 'Cable Type:', value: selectedCableType),
                    (text: 'Amount:', value: amount),
                  ].map(
                    (e) => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                e.text,
                                style: context.textTheme.displayLarge?.copyWith(
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
                                  style:
                                      context.textTheme.displayLarge?.copyWith(
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
                  ),
                  AppSpacing.setVerticalSpace(29),
                  Button(
                    onPressed: () {},
                    text: 'Make Payment',
                    backgroundColor: AppColors.primaryColor,
                  ),
                   AppSpacing.setVerticalSpace(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CableTvSelectorCard extends StatelessWidget {
  const _CableTvSelectorCard({
    required this.selectedCableTv,
  });

  final ValueNotifier<TvCable?> selectedCableTv;

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
            child: _BillerSelectorModal(
              selectedCableTv: selectedCableTv,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.radius,
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
              child: selectedCableTv.value == null
                  ? Text(
                      'Select a provider',
                      style: context.theme.inputDecorationTheme.hintStyle,
                    )
                  : Row(
                      children: [
                        Container(
                          height: 34.radius,
                          width: 34.radius,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                selectedCableTv.value!.assets,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          selectedCableTv.value!.name,
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

class _BillerSelectorModal extends StatelessWidget {
  const _BillerSelectorModal({
    required this.selectedCableTv,
  });

  final ValueNotifier<TvCable?> selectedCableTv;

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
                'Select Biller',
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
                  selectedCableTv.value = TvCable.values[index];
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Image.asset(
                      TvCable.values[index].assets,
                      height: 46.radius,
                      width: 46.radius,
                    ),
                    AppSpacing.horizontalSpaceSmall,
                    Text(
                      TvCable.values[index].name,
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, index) => AppSpacing.setVerticalSpace(36),
              itemCount: TvCable.values.length,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class ElectricityPaymentPage extends HookWidget {
  const ElectricityPaymentPage({super.key});

  static const routeName = 'electricity-payments';

  @override
  Widget build(BuildContext context) {
    final meterNumber = useTextEditingController();
    final hasMeterNumber = useState(false);
    final selectedBiller =
        useState<ElectricityBiller?>(ElectricityBiller.ikeja);
    meterNumber.addListener(() {
      hasMeterNumber.value = meterNumber.text.isNotEmpty;
    });
    final selectedPaymentItem = useState<String?>(null);

    final amountController = useTextEditingController();
    final selectedBillerIndex = useState(-1);
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
            const CustomAppBarWithBackButton(text: 'Electricity'),
            AppSpacing.setVerticalSpace(37),
            _ElectricityBillerSelectorCard(
              selectedBiller: selectedBiller,
            ),
            AppSpacing.setVerticalSpace(16),
            CustomDropDownButton(
              label: 'Payment item',
              texts: const [
                'Prepaid',
                'Postpaid',
              ],
              hintText: 'Prepaid',
              value: selectedPaymentItem.value,
              onChanged: (value) => selectedPaymentItem.value = value,
            ),
            AppSpacing.setVerticalSpace(16),
            CustomInputField(
              label: 'Meter Number',
              controller: meterNumber,
              hintText: 'Enter Meter number',
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
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.width,
                      mainAxisSpacing: 8.height,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        selectedBillerIndex.value = index;

                        amountController.text = [
                          '50',
                          '100',
                          '200',
                          '500',
                          '1,000',
                          '2,000',
                        ].elementAt(index);
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
                        child: RichText(
                          text: TextSpan(
                            text: 'N',
                            style: context.textTheme.displayLarge?.copyWith(
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
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 24.fontSize,
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
            AppSpacing.setVerticalSpace(21),
            CustomInputField(
              label: 'Enter amount',
              hintText: 'N 50- 50,000',
              controller: amountController,
            ),
            AppSpacing.setVerticalSpace(41),
            Button(
              enable: hasMeterNumber.value &&
                  selectedBiller.value != null &&
                  selectedPaymentItem.value != null,
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
                builder: (_) => const _MeterDetails(),
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
  const _PaymentSummary();
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
                    (
                      text: 'Biller Name:',
                      value: 'Abuja Electricity Distribution Company'
                    ),
                    (text: 'Payment item:', value: 'Abuja Prepaid'),
                    (text: 'Meter Number:', value: '987654567890'),
                    (text: 'Meter Name:', value: 'Isaiah Nwankwo'),
                    (
                      text: 'Address:',
                      value: 'NKA236/ Finance Quaters, Kubwa,Abuja'
                    ),
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
                                  flex: 2,
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

class _MeterDetails extends StatelessWidget {
  const _MeterDetails();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.setVerticalSpace(14),
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
        AppSpacing.setVerticalSpace(14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.radius),
          child: Column(
            children: [
              Text(
                'Confirm Meter Details',
                style: context.textTheme.displayMedium?.copyWith(
                  fontSize: 20.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacing.setVerticalSpace(27),
              ...[
                (
                  text: 'Biller Name:',
                  value: 'Abuja Electricity Distribution Company'
                ),
                (text: 'Payment item:', value: 'Abuja Prepaid'),
                (text: 'Meter Number:', value: '987654567890'),
                (text: 'Meter Name:', value: 'Isaiah Nwankwo'),
                (
                  text: 'Address:',
                  value: 'NKA236/ Finance Quaters, Kubwa,Abuja'
                ),
              ]
                  .map(
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
                              flex: 2,
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
                  )
                  .toList(),
              AppSpacing.setVerticalSpace(63),
              Button(
                onPressed: () {
                  Navigator.of(context).pop();
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
                    builder: (_) => const _PaymentSummary(),
                  );
                },
                text: 'Confirm to pay',
                backgroundColor: AppColors.primaryColor,
              ),
              AppSpacing.setVerticalSpace(22),
              Button(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Retry',
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.primaryColor,
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.setVerticalSpace(35),
      ],
    );
  }
}

class _ElectricityBillerSelectorCard extends StatelessWidget {
  const _ElectricityBillerSelectorCard({
    required this.selectedBiller,
  });

  final ValueNotifier<ElectricityBiller?> selectedBiller;

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
            child: _ElectricityBillerSelectorModal(
              selectedBiller: selectedBiller,
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
              child: selectedBiller.value == null
                  ? Text(
                      'Select a network provider',
                      style: context.theme.inputDecorationTheme.hintStyle,
                    )
                  : Row(
                      children: [
                        SvgImageAsset(
                          selectedBiller.value!.assets,
                          height: 34.radius,
                          width: 34.radius,
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          selectedBiller.value!.name,
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

class _ElectricityBillerSelectorModal extends StatelessWidget {
  const _ElectricityBillerSelectorModal({
    required this.selectedBiller,
  });

  final ValueNotifier<ElectricityBiller?> selectedBiller;

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
                  selectedBiller.value = ElectricityBiller.values[index];
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    SvgImageAsset(
                      ElectricityBiller.values[index].assets,
                    ),
                    AppSpacing.horizontalSpaceSmall,
                    Text(
                      ElectricityBiller.values[index].name,
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 20.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, index) => AppSpacing.setVerticalSpace(36),
              itemCount: ElectricityBiller.values.length,
            ),
          ),
        ),
      ],
    );
  }
}

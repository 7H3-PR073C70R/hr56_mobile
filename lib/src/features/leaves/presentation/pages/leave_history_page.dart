import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/widgets/leave_card.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/search_field.dart';

class LeaveHistoryPage extends StatelessWidget {
  const LeaveHistoryPage({super.key});

  static const routeName = 'leave-history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          const CustomAppBarWithBackButton(
            text: 'Leave history',
          ),
          AppSpacing.setVerticalSpace(20),
          const _Header(),
          AppSpacing.setVerticalSpace(25),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => LeaveCard(
                status: LeaveStatus.values[index % 3],
                approvalMessage: 'Awaiting approval from reliever',
                date: '10/03/2023',
                reason: 'Paternal leave ',
                title: 'Parental Leave',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SearchField(
            hint: 'Parental leave',
          ),
          AppSpacing.verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: SizedBox(
              height: 30.height,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.width),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF56006B),
                    ),
                    borderRadius: BorderRadius.circular(20.radius),
                  ),
                  child: Text(
                    [
                      'Hospital Leave',
                      'Sick Leave',
                      'Maternal Leave',
                      'Parental Leave'
                    ].elementAt(index),
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 13.fontSize,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF56006B),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => AppSpacing.horizontalSpaceMedium,
                itemCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

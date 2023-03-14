import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/home/presentation/widgets/notification_card.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const routeName = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          CustomAppBarWithBackButton(
            text: 'Notification',
            leading: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          AppSpacing.setVerticalSpace(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'New',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                      ),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(12),
                  ...List.generate(
                    2,
                    (index) => const NotificationCard(
                      type: NotificationType.loan,
                      title:
                          'Loan request has been submitted, '
                          'and would be processed.',
                      date: 'Monday, 12 : 12  PM',
                    ),
                  ),
                  AppSpacing.setVerticalSpace(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Older',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                      ),
                    ),
                  ),
                  AppSpacing.setVerticalSpace(12),
                  ...List.generate(
                    20,
                    (index) => const NotificationCard(
                      type: NotificationType.loan,
                      title:
                          'Loan request has been submitted, '
                          'and would be processed.',
                      date: 'Monday, 12 : 12  PM',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

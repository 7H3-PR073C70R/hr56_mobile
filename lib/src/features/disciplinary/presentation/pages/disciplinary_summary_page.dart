import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class DisciplinarySummaryPage extends StatelessWidget {
  const DisciplinarySummaryPage({super.key, required this.type});

  static const routeName = 'disciplinary-summary';

  final DisciplinaryType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppBarWithBackButton(
              text: '${type.title} Details',
            ),
            AppSpacing.setVerticalSpace(31),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Query Letter To Employee',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF171C1E),
                      ),
                    ),
                    AppSpacing.verticalSpaceTiny,
                    Text(
                      '[HR of the respective company]',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF475664),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(24),
                    Text(
                      'To,\n[Name of addressee]',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF475664),
                      ),
                    ),
                    AppSpacing.verticalSpaceTiny,
                    Text(
                      '13-03-2023',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF050606),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(20),
                    Text(
                      'Subject: Letter of Query to Employee',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF171C1E),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(32),
                    Text(
                      'Respected sir/madam,',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF212225),
                      ),
                    ),
                    AppSpacing.setVerticalSpace(7),
                    Text(
                      '''
I [mention your name], the HR of this company, wanted to know about the issue under the team leader of [mention team lead name].
I learned from the manager that your teamwork is not in the proper position, and many team members are not working sincerely.
              
Many members are not coming to the office on time. And many times, your team has failed to submit their work within the deadline. This letter is for the team leader with the instruction to maintain your team properly and make them work properly.
This is against the company rules and regulations.
                        
Coming to the office at a mentioned time is the basic need for every employee which should be full filled by every member of this company.
                        
I hope from now on all the team members will work properly and will maintain all the rules and regulations set by the company. And I hope, after this, I will not get any complaints from any of the employees.
If you have any further queries you can reach me at [mention phone number] or through an email [mention email address].
Sincerely,
[Sender Name]
''',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w300,
                        color: AppColors.blackColor,
                      ),
                    ),
                     AppSpacing.setVerticalSpace(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

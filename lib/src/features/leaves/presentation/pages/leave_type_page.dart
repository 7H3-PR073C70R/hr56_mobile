import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/leaves/presentation/blocs/leave_bloc.dart';
import 'package:hr56_staff/src/features/leaves/presentation/pages/request_leave_page.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';

class LeaveTypePage extends StatelessWidget {
  const LeaveTypePage({super.key});

  static const routeName = 'leave-type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const CustomAppBarWithBackButton(text: ''),
            AppSpacing.verticalSpaceMedium,
            Text(
              'Please select the type of leave you are'
              ' applying for from the cards.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 16.fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSpacing.setVerticalSpace(20),
            Expanded(
              child: BlocBuilder<LeaveBloc, LeaveState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (_, index) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<LeaveBloc>().add(
                              LeaveEvent.selectLeaveType(
                                state.leaveTypes[index].name ?? '',
                              ),
                            );
                        context.navigator.pushNamed(
                          RequestLeavePage.routeName,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 19,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.radius),
                          color: const Color(0xFFF3C3FF).withOpacity(.3),
                        ),
                        child: Row(
                          children: [
                            SvgImageAsset(
                              LeaveType.values[index % LeaveType.values.length]
                                  .iconPath,
                            ),
                            AppSpacing.horizontalSpaceMedium,
                            Expanded(
                              child: Text(
                                state.leaveTypes[index].name ?? 'Unknown',
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 16.fontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) =>
                        AppSpacing.setVerticalSpace(16),
                    itemCount: state.leaveTypes.length,
                  );
                },
              ),
            ),
            AppSpacing.setVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}

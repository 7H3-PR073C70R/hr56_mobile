import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/features/leaves/presentation/blocs/leave_bloc.dart';
import 'package:hr56_staff/src/features/leaves/presentation/widgets/leave_card.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_loading_indicator.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';
import 'package:hr56_staff/src/shared/search_field.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';
import 'package:intl/intl.dart';

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
          Expanded(
            child: BlocBuilder<LeaveBloc, LeaveState>(
              bloc: context.read<LeaveBloc>()
                ..add(
                  const LeaveEvent.started(),
                ),
              builder: (context, state) {
                if (state.viewState.isProcessing) {
                  return const Center(
                    child: CustomLoadingIndicator(),
                  );
                } else if (state.leaves.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.horizontalSpacing,
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        AppSpacing.setVerticalSpace(58),
                        const SvgImageAsset(AppAssetPath.leaveEmpty),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            width: 155.width,
                            radius: 30,
                            backgroundColor: AppColors.primaryColor,
                            onPressed: () => context.navigator.replaceAll(
                              const [
                                MainRoute(
                                  children: [
                                    LeaveRoute(
                                      children: [
                                        LeaveTypeRoute(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            text: 'Request Leave',
                          ),
                        ),
                        AppSpacing.setVerticalSpace(48),
                      ],
                    ),
                  );
                }

                return Column(
                  children: [
                    const _Header(),
                    AppSpacing.setVerticalSpace(25),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.leaves.length,
                        itemBuilder: (context, index) => LeaveCard(
                          status: LeaveStatus.values[index % 3],
                          approvalMessage:
                              state.leaves[index].duration ?? 'No Duration',
                          date: DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                              state.leaves[index].createdAt ??
                                  DateTime.now().toIso8601String(),
                            ),
                          ),
                          reason: state.leaves[index].reason ?? 'No Stated',
                          title: state.leaves[index].department ?? 'No Title',
                        ),
                      ),
                    ),
                  ],
                );
              },
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
              child: BlocBuilder<LeaveBloc, LeaveState>(
                builder: (context, state) {
                  return ListView.separated(
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
                        state.leaveTypes[index].name ?? '',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 13.fontSize,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF56006B),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) =>
                        AppSpacing.horizontalSpaceMedium,
                    itemCount: state.leaveTypes.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

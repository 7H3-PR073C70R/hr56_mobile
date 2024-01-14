// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/features/wallet/presentation/widgets/app_bar_background.dart';
import 'package:hr56_staff/src/features/wallet/presentation/widgets/custom_app_bar.dart';
import 'package:hr56_staff/src/features/wallet/presentation/widgets/transaction_card.dart';
import 'package:hr56_staff/src/shared/svg_image.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  static const routeName = 'wallet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<WalletBloc>().add(
                    const WalletEvent.started(),
                  );
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 410.height,
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xFF56006B),
                  flexibleSpace: const FlexibleSpaceBar(
                    background: AppBarBackground(),
                  ),
                  title: const WalletAppBar(),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.verticalSpaceLarge,
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              shadowColor: const Color(0xFFB4BBC0),
                              color: AppColors.whiteColor,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.radius),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Services',
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 16.fontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    AppSpacing.verticalSpaceMedium,
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.spaceBetween,
                                      runAlignment: WrapAlignment.spaceBetween,
                                      spacing: 30.width,
                                      runSpacing: 20.height,
                                      children: Services.values
                                          .map(
                                            (service) => GestureDetector(
                                              onTap: service.route(context),
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 44.radius,
                                                    width: 44.radius,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFF67706B,
                                                      ).withOpacity(.3),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFF67706B,
                                                        ),
                                                      ),
                                                    ),
                                                    child: SvgImageAsset(
                                                      service.asset,
                                                    ),
                                                  ),
                                                  AppSpacing.verticalSpaceSmall,
                                                  Text(
                                                    service.title,
                                                    style: context
                                                        .textTheme.displayLarge
                                                        ?.copyWith(
                                                      fontSize: 12.fontSize,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.setVerticalSpace(18),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 24),
                          //   child: Text(
                          //     '23 Feb 2023',
                          //     style: context.textTheme.displayLarge?.copyWith(
                          //       fontSize: 13.fontSize,
                          //       fontWeight: FontWeight.w400,
                          //       color: const Color(0xFF555151),
                          //     ),
                          //   ),
                          // ),
                          // AppSpacing.setVerticalSpace(18),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return TransactionCard(
                        name: state.transactions[index].narration
                                ?.capitalizeFirst ??
                            '',
                        time: DateFormat('dd MMM, yyyy. hh:mm a').format(
                          state.transactions[index].createdAt ?? DateTime.now(),
                        ),
                        isDebt: state.transactions[index].action == 'debit',
                        amount: double.tryParse(
                              state.transactions[index].amount ?? '',
                            )?.toAmount ??
                            '',
                        isFirst: index == 0,
                        isLast: index == state.transactions.length - 1,
                      );
                    },
                    childCount: state.transactions.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

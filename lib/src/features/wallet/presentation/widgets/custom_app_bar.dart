import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_env.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';

class WalletAppBar extends HookWidget {
  const WalletAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = useMemoized(
      () => locator<UserStorageService>().user,
    );
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return SizedBox(
          height: 40.height,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 25.radius,
                backgroundImage: NetworkImage(
                  '${AppEnv.apiBaseURL}${user?.profilePhotoPath ?? ''}',
                ),
                onBackgroundImageError: (exception, stackTrace) {},
              ),
              AppSpacing.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      'Bridgegap Consults',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 11.fontSize,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Stack(
                children: [
                  Icon(Icons.notifications),
                  // Positioned(
                  //   right: 0,
                  //   child: CircleAvatar(
                  //     radius: 8.radius,
                  //     backgroundColor: AppColors.errorColor,
                  //     child: Center(
                  //       child: Text(
                  //         '0',
                  //         style: context.textTheme.displayLarge?.copyWith(
                  //           fontSize: 12.fontSize,
                  //           fontWeight: FontWeight.w500,
                  //           color: AppColors.whiteColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

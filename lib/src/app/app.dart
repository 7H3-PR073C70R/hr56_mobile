import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/app/bloc/app_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/core/themes/app_theme.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/leaves/presentation/blocs/leave_bloc.dart';
import 'package:hr56_staff/src/features/wallet/presentation/blocs/wallet_bloc.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppBloc(
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                )..add(const AppEvent.started()),
                lazy: false,
              ),
              BlocProvider(
                create: (context) => LeaveBloc(
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                ),
              ),
              BlocProvider(
                create: (context) => WalletBloc(
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                  locator(),
                )..add(const WalletEvent.started()),
              ),
            ],
            child: MaterialApp.router(
              title: AppStrings.appName,
              themeMode: ThemeMode.light,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              routerDelegate: _appRouter.delegate(
                initialRoutes: [
                  if (locator<UserStorageService>().completedOnboarding)
                    const LoginRoute()
                  else
                    const OnboardingRoute(),
                ],
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          );
        },
      ),
    );
  }
}

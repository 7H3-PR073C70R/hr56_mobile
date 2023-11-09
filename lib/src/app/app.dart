import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/app/bloc/app_bloc.dart';
import 'package:hr56_staff/src/core/constants/app_strings.dart';
import 'package:hr56_staff/src/core/router/app_router.dart';
import 'package:hr56_staff/src/core/themes/app_theme.dart';
import 'package:hr56_staff/src/di/locator.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
          ],
          child: MaterialApp.router(
            title: AppStrings.appName,
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          ),
        );
      },
    );
  }
}

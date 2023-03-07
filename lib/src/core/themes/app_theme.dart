import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'ClashDisplay',
        shadowColor: const Color(0xFF110C2E).withOpacity(0.15),
        inputDecorationTheme: InputDecorationTheme(
          helperStyle: TextStyle(
            fontSize: 14.fontSize,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.width,
            vertical: 14.height,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.radius),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.radius),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.radius),
          ),
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
            fontSize: 12.fontSize,
          ),
          bodyLarge: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
            fontSize: 16.fontSize,
          ),
          bodyMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14.fontSize,
            fontWeight: FontWeight.w400,
          ),
          displayLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 24.fontSize,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20.fontSize,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: const TextStyle(color: Colors.white),
          labelLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 15.fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.46,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.fontSize,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'ClashDisplay',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: const MaterialColor(
          0xFFFFFFFF,
          {
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFFFFFFFF),
            300: Color(0xFFFFFFFF),
            400: Color(0xFFFFFFFF),
            500: Color(0xFFFFFFFF),
            600: Color(0xFFFFFFFF),
            700: Color(0xFFFFFFFF),
            800: Color(0xFFFFFFFF),
            900: Color(0xFFFFFFFF),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFFFFFF),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF000000),
          ),
        ),
      );
}

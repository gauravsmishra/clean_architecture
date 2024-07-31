import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/styles.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.screenBackgroundColor,
    textTheme: TextTheme(
      labelSmall:
          Styles.regularTextWidgetStyle(color: AppColors.textBlackColor),
      labelLarge: Styles.normalTextWidgetStyle(color: AppColors.textBlackColor),
      labelMedium:
          Styles.mediumTextWidgetStyle(color: AppColors.textBlackColor),
      bodySmall: Styles.regularTextWidgetStyle(color: AppColors.textBlackColor),
      bodyLarge: Styles.normalTextWidgetStyle(color: AppColors.textBlackColor),
      bodyMedium: Styles.mediumTextWidgetStyle(color: AppColors.textBlackColor),
      titleLarge: Styles.normalTextWidgetStyle(color: AppColors.textBlackColor),
      titleMedium:
          Styles.mediumTextWidgetStyle(color: AppColors.textBlackColor),
      titleSmall:
          Styles.regularTextWidgetStyle(color: AppColors.textBlackColor),
    ),
    listTileTheme: ListTileThemeData(
      textColor: AppColors.textBlackColor,
      subtitleTextStyle: Styles.normalTextWidgetStyle(
          size: 12, color: AppColors.textLightColor),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      secondaryContainer: AppColors.textFieldFillColor,
      primary: AppColors.blackBackgroundColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.textBlackColor),
    disabledColor: AppColors.textLightColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.screenBackgroundColor,
      iconTheme: IconThemeData(color: AppColors.textBlackColor),
      titleTextStyle: TextStyle(fontSize: 20, color: AppColors.textBlackColor),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.screenBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.screenBackgroundColor),
    ),
    dialogBackgroundColor: AppColors.whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldFillColor,
      hintStyle: Styles.regularTextWidgetStyle(
          color: AppColors.textLightColor, size: 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.blackBackgroundColor,
        contentTextStyle:
            Styles.normalTextWidgetStyle(color: AppColors.whiteColor)));

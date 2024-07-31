import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_poc/core/theme/app_colors.dart';

import '../styles/styles.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackBackgroundColor,
    textTheme: TextTheme(
      labelSmall: Styles.regularTextWidgetStyle(color: AppColors.whiteColor),
      labelLarge: Styles.normalTextWidgetStyle(color: AppColors.whiteColor),
      labelMedium: Styles.mediumTextWidgetStyle(color: AppColors.whiteColor),
      bodySmall: Styles.regularTextWidgetStyle(color: AppColors.whiteColor),
      bodyLarge: Styles.normalTextWidgetStyle(color: AppColors.whiteColor),
      bodyMedium: Styles.mediumTextWidgetStyle(color: AppColors.whiteColor),
      titleLarge: Styles.normalTextWidgetStyle(color: AppColors.whiteColor),
      titleMedium: Styles.mediumTextWidgetStyle(color: AppColors.whiteColor),
      titleSmall: Styles.regularTextWidgetStyle(color: AppColors.whiteColor),
    ),
    listTileTheme: ListTileThemeData(
      textColor: AppColors.whiteColor,
      subtitleTextStyle:
          Styles.normalTextWidgetStyle(size: 12, color: AppColors.whiteColor),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      secondaryContainer: AppColors.lightBlackBackgroundColor,
      primary: AppColors.whiteColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    disabledColor: AppColors.textLightColor.withOpacity(0.6),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBackgroundColor,
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
      titleTextStyle:
          Styles.mediumTextWidgetStyle(size: 20, color: AppColors.whiteColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.blackBackgroundColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.blackBackgroundColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightBlackBackgroundColor,
      hintStyle: Styles.regularTextWidgetStyle(
          color: AppColors.textLightColor, size: 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.lightBlackBackgroundColor,
        contentTextStyle:
            Styles.normalTextWidgetStyle(color: AppColors.whiteColor)));

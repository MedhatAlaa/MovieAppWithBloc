import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_movie_app/presentation/resources/styles_manger.dart';
import 'package:new_movie_app/presentation/resources/values_manger.dart';

import 'color_manger.dart';
import 'fonts_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// Colors Theme
    scaffoldBackgroundColor: ColorManger.black,
    primaryColor: ColorManger.primary,
    disabledColor: ColorManger.lightGrey,

    /// Card Theme
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.lightGrey,
      elevation: AppSizeManger.s4,
    ),

    /// App Bar Theme
    appBarTheme: AppBarTheme(
        color: ColorManger.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManger.black,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: getRegularStyle(
            color: ColorManger.white, fontSize: AppSizeManger.s16)),

    /// Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManger.lightGrey,
      buttonColor: ColorManger.pink,
      splashColor: ColorManger.orange,
    ),

    /// Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManger.yellow,
        foregroundColor: ColorManger.white,
        disabledBackgroundColor: ColorManger.grey,
        disabledForegroundColor: ColorManger.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManger.s14)),
        textStyle: getRegularStyle(
            color: ColorManger.white, fontSize: AppSizeManger.s18),
      ),
    ),

    /// Text Theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorManger.yellow, fontSize: FontSizeManger.s16),
      headlineMedium: getSemiBoldStyle(
          color: ColorManger.white, fontSize: FontSizeManger.s14),
      headlineSmall: getRegularStyle(
          color: ColorManger.grey, fontSize: FontSizeManger.s14),
      titleLarge: getSemiBoldStyle(
          color: ColorManger.pink, fontSize: FontSizeManger.s16),
      displayLarge: getMediumStyle(
          color: ColorManger.yellow, fontSize: FontSizeManger.s16),
      titleMedium:
          getBoldStyle(color: ColorManger.yellow, fontSize: FontSizeManger.s14),
      titleSmall: getMediumStyle(
          color: ColorManger.yellow, fontSize: FontSizeManger.s14),
      bodySmall: getRegularStyle(
          color: ColorManger.yellow, fontSize: FontSizeManger.s12),
      labelSmall: getRegularStyle(
          color: ColorManger.white, fontSize: FontSizeManger.s12),
      bodyLarge: getBoldStyle(color:ColorManger.white, fontSize: FontSizeManger.s14),
    ),

    /// Input Decoration Theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPaddingManger.p12),
      labelStyle:
          getMediumStyle(color: ColorManger.grey, fontSize: FontSizeManger.s14),
      hintStyle: getRegularStyle(
          color: ColorManger.grey, fontSize: FontSizeManger.s14),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.yellow),
        borderRadius: BorderRadius.circular(AppSizeManger.s12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.grey),
        borderRadius: BorderRadius.circular(AppSizeManger.s12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error),
        borderRadius: BorderRadius.circular(AppSizeManger.s12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error),
        borderRadius: BorderRadius.circular(AppSizeManger.s12),
      ),
    ),

    /// Bottom Navigation BarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManger.black,
      unselectedItemColor: ColorManger.grey,
      selectedItemColor: ColorManger.yellow,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/theming/app_colors.dart';

class Theming {
  ThemeData themeData = ThemeData(
    primaryColor: _getMaterialColor(AppColors.mainColor),
    primaryColorLight: _getMaterialColor(AppColors.mainColorLight),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
        color: AppColors.headLineColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: AppColors.headLineColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.bodyColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.bodyColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.hintColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor, width: 1.0),
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColors.headLineColor,
        fontSize: 16.0,
      ),
      floatingLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.headLineColor,
        fontSize: 14.0,
      ),
      suffixIconColor: AppColors.hintColor,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColors.hintColor,
        fontSize: 14.0,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.mainColor,
      linearTrackColor: Color(0x211936BD),
    ),
  );
}

MaterialColor _getMaterialColor(Color color) {
  final int red = color.r.toInt();
  final int green = color.g.toInt();
  final int blue = color.g.toInt();

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.toARGB32(), shades);
}

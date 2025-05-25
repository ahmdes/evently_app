import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemesManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.light,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.light,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: ColorsManager.dark,
      ),
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorsManager.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 1.w,
          color: ColorsManager.grey,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.blue,
        selectedIconTheme: IconThemeData(
          size: 50,
        ),
        selectedItemColor: ColorsManager.light,
        unselectedItemColor: ColorsManager.light,
        unselectedIconTheme: IconThemeData(
          size: 30,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        )),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.dark,
  );
}

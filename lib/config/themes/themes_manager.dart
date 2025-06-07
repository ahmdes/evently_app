import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.light,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.blue,
      ),
      backgroundColor: ColorsManager.light,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.dark,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.r,
        ),
      ),
      elevation: 0,
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
    tabBarTheme: TabBarTheme(

      tabAlignment: TabAlignment.start,
      labelColor: ColorsManager.blue,
      unselectedLabelColor: ColorsManager.light,
      indicatorColor: ColorsManager.transparent,
      dividerHeight: 0,
      labelPadding: EdgeInsets.only(
        right: 10,
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
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.dark,
  );
}

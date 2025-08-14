import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.light,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.dark,
      ),
      backgroundColor: ColorsManager.light,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: ColorsManager.dark,
      ),
      centerTitle: true,
    ),
    primaryColor: ColorsManager.blue,
    primaryColorLight: ColorsManager.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.dark,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.light,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      displayMedium: GoogleFonts.inter(
        color: ColorsManager.light,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.dark,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.inter(
        color: ColorsManager.light,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      displayLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        color: ColorsManager.blue,
        decorationColor: ColorsManager.blue,
        decorationThickness: 2,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.dark,
    ),
    iconButtonTheme: IconButtonThemeData(
        style:IconButton.styleFrom(
          foregroundColor: ColorsManager.dark,
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.light,
      foregroundColor: ColorsManager.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.r,
        ),

      ),

      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(361.w, 57.h),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: ColorsManager.transparent,
            width: 2.w,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      iconColor: ColorsManager.grey,
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
      prefixStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorsManager.blue,
      ),
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
          width: 3.w,
          color: ColorsManager.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.grey,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      labelColor: ColorsManager.light,
      unselectedLabelColor: ColorsManager.blue,
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
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.blue,
      ),
      backgroundColor: ColorsManager.dark,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),
      centerTitle: true,
    ),
    primaryColor: ColorsManager.dark,
    primaryColorLight: ColorsManager.dark,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.light,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        color: ColorsManager.blue,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.light,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      displayMedium: GoogleFonts.inter(
        color: ColorsManager.light,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.light,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.inter(
        color: ColorsManager.light,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      displayLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        color: ColorsManager.blue,
        decorationColor: ColorsManager.blue,
        decorationThickness: 2,
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.light,
    ),
    iconButtonTheme: IconButtonThemeData(
      style:IconButton.styleFrom(
        foregroundColor: ColorsManager.blue,
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.light,
      foregroundColor: ColorsManager.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.r,
        ),

      ),

      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(361.w, 57.h),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: ColorsManager.transparent,
            width: 2.w,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      iconColor: ColorsManager.light,
      prefixIconColor: ColorsManager.light,
      suffixIconColor: ColorsManager.light,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorsManager.light,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.blue,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.blue,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          width: 3.w,
          color: ColorsManager.blue,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      labelColor: ColorsManager.light,
      unselectedLabelColor: ColorsManager.blue,
      indicatorColor: ColorsManager.transparent,
      dividerHeight: 0,
      labelPadding: EdgeInsets.only(
        right: 10,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.dark,
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
}

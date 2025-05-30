import 'package:evently_project/config/themes/themes_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.signIn,
        theme: ThemesManager.light,
        darkTheme: ThemesManager.dark,
        themeMode: ThemeMode.light,
        onGenerateRoute: RoutesManager.router,
      ),
    );
  }
}

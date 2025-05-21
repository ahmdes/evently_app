import 'package:evently_project/config/themes/themes_manager.dart';
import 'package:flutter/material.dart';
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesManager.light,
      darkTheme: ThemesManager.dark,
      themeMode: ThemeMode.light,
      onGenerateRoute: ,
      initialRoute: ,
    );
  }
}

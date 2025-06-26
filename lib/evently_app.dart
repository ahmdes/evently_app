import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/config/themes/themes_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider= Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize:Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.onBoarding,
        theme: ThemesManager.light,
        darkTheme: ThemesManager.dark,
        themeMode: configProvider.currentTheme,
        onGenerateRoute: RoutesManager.router,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        locale:configProvider.currentLanguage,
      ),
    );
  }
}

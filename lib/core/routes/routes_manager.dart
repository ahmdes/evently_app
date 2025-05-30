import 'package:evently_project/presentation/authentication/resetPassword/reset_password.dart';
import 'package:evently_project/presentation/authentication/signIn/sign_in.dart';
import 'package:evently_project/presentation/create_event/create_event.dart';
import 'package:evently_project/presentation/main_layout/main_layout.dart';
import 'package:evently_project/presentation/main_layout/tabs/map/map_location.dart';
import 'package:evently_project/presentation/main_layout/tabs/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/authentication/signUp/sign_up.dart';
import '../../presentation/main_layout/tabs/home/home.dart';
import '../../presentation/main_layout/tabs/favourite/favourite.dart';

class RoutesManager {
  static const String signIn = "/SignIn";
  static const String signUp = "/SignUp";
  static const String resetPassword = "/ResetPassword";
  static const String mainLayout = "/MainLayout";
  static const String home = "/Home";
  static const String mapLocation = "/MapLocation";
  static const String favourite = "/Favourite";
  static const String profile = "/Profile";
  static const String createEvent = "/CreateEvent";


  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return CupertinoPageRoute(
          builder: (context) => SignIn(),
        );
      case signUp:
        return CupertinoPageRoute(
          builder: (context) => SignUp(),
        );
      case resetPassword:
        return CupertinoPageRoute(
          builder: (context) => ResetPassword(),
        );
      case mainLayout:
        return CupertinoPageRoute(
          builder: (context) => MainLayout(),
        );
      case home:
        return CupertinoPageRoute(
          builder: (context) => Home(),
        );
      case mapLocation:
        return CupertinoPageRoute(
          builder: (context) => MapLocation(),
        );
      case favourite:
        return CupertinoPageRoute(
          builder: (context) => Favourite(),
        );
      case profile:
        return CupertinoPageRoute(
          builder: (context) => Profile(),
        );
      case createEvent:
        return CupertinoPageRoute(
          builder: (context) => CreateEvent(),
        );
    }
  }
}

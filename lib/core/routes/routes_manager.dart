import 'package:evently_project/presentation/authentication/resetPassword/reset_password.dart';
import 'package:evently_project/presentation/authentication/signIn/sign_in.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/authentication/signUp/sign_up.dart';

class RoutesManager{
  static const String signIn="/SignIn";
  static const String signUp="/SignUp";
  static const String resetPassword="/ResetPassword";
  static Route? router(RouteSettings settings)
  {
    switch(settings.name)
    {
      case signIn:return CupertinoPageRoute(builder: (context)=>SignIn(),);
      case signUp:return CupertinoPageRoute(builder: (context)=>SignUp(),);
      case resetPassword:return CupertinoPageRoute(builder: (context)=>ResetPassword(),);

    }
  }
}
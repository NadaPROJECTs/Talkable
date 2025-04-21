import 'package:flutter/material.dart';
import 'package:savvyflos/presentation/screens/educationScreen/educationscreen.dart';
import 'package:savvyflos/presentation/screens/home/home.dart';
import 'package:savvyflos/auth/signup/presentation/pages/signup.dart';
import 'package:savvyflos/presentation/screens/splash/splash_screen.dart';
import 'package:savvyflos/presentation/screens/translationScreen/translaionedit.dart';
import '../../auth/login/presentation/pages/login_edit.dart';



class RoutesManager {
  static const String home = "/HomeScreen";
  static const String splash = "/splash_screen";
  static const String login = "/LoginScreen";
  static const String signUp = "/SignUpPage";
  static const String translation = "/HomePage";
  static const String education = "/education";




  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpPage());

      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case home :
        return MaterialPageRoute(builder: (context) =>  HomeScreen());

      case translation :
        return MaterialPageRoute(builder: (context) =>  HomePage2());


      case education :
        return MaterialPageRoute(builder: (context) =>  EducationScreen());




    }
  }
}
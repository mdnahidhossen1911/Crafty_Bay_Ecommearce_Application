import 'package:crafty_bay/feature/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/feature/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/feature/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    }else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
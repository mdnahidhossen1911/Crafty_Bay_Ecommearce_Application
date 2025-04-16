import 'package:crafty_bay/feature/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/feature/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/feature/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/feature/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/feature/common/screens/main_botton_nav_screen.dart';
import 'package:crafty_bay/feature/product/screens/product_add_review_screen.dart';
import 'package:crafty_bay/feature/product/screens/product_details_screen.dart';
import 'package:crafty_bay/feature/product/screens/product_list_screen.dart';
import 'package:crafty_bay/feature/product/screens/product_review_screen.dart';
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
    }else if (settings.name == OtpVerificationScreen.name) {
      String email = settings.arguments as String;
      route =  OtpVerificationScreen(email: email,);
    }else if (settings.name == MainBottomNavScreen.name) {
      route = const MainBottomNavScreen();
    }else if (settings.name == ProductListScreen.name) {
      String category = settings.arguments as String;
      route =  ProductListScreen(category: category);
    }else if (settings.name == ProductDetailsScreen.name) {
      route = const ProductDetailsScreen();
    }else if (settings.name == ProductReviewScreen.name) {
      route = const ProductReviewScreen();
    }else if (settings.name == ProductAddReviewScreen.name) {
      route = const ProductAddReviewScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
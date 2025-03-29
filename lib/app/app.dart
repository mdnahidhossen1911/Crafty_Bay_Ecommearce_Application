import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/app_routes.dart';
import 'package:flutter/material.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: AppColors.themeColor,
      ),
    );
  }
}

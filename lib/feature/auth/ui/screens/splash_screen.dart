import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/app_config.dart';
import 'package:crafty_bay/app/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(AssetsPath.logoSvg,width: 120,),
              Spacer(),
              CircularProgressIndicator(color: AppColors.themeColor),
              const SizedBox(height: 16),
              Text('version: ${AppConfigs.currentAppVersion}'),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}

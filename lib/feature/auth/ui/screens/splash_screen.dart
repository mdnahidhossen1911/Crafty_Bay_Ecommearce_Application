import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/app_config.dart';
import 'package:crafty_bay/feature/auth/data/model/auth_controller.dart';
import 'package:crafty_bay/feature/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/feature/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/feature/common/screens/main_botton_nav_screen.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  Future<void> _moveNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    bool isLogin = await Get.find<AuthController>().isUserLoggedIn();
    if(isLogin){
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    }else{
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(color: AppColors.themeColor),
              const SizedBox(height: 16),
              Text('${context.localization.version}: ${AppConfigs.currentAppVersion}'),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}


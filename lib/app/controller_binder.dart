import 'package:crafty_bay/feature/auth/data/model/auth_controller.dart';
import 'package:crafty_bay/feature/auth/ui/controller/otp_veriffication_controller.dart';
import 'package:crafty_bay/feature/auth/ui/controller/sign_in_controller.dart';
import 'package:crafty_bay/feature/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:crafty_bay/feature/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavIndexController());
    Get.put(NetworkCaller());
    Get.put(AuthController());
    Get.lazyPut(() =>  SignInController());
    Get.lazyPut(() =>  SignUpController());
    Get.lazyPut(() =>  OtpVerifyicationController());
  }
}
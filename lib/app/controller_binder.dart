import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavIndexController());
  }
}
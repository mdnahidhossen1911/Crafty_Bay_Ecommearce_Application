import 'package:get/get.dart';

class MainBottomNavIndexController extends GetxController {
  int _index = 0;
  int get currentIndex => _index;

  void changeIndex(int index){
    _index = index;
    update();
  }

  void moveToCategory(){
    changeIndex(1);
  }

  void backHome(){
    changeIndex(0);
  }
}
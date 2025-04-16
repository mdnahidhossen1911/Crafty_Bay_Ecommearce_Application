import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/feature/auth/data/model/sign_in_request_model.dart';
import 'package:crafty_bay/feature/auth/data/model/sign_up_model.dart';
import 'package:crafty_bay/feature/auth/data/model/user_model.dart';
import 'package:crafty_bay/feature/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  Future<bool> signUp(SignUpModel userModel) async {
    bool isSuccess = false;

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signUpUrl,
      body: userModel.toJson(),
    );
    if(response.isSuccess){
      isSuccess =true;
      _errorMsg = '';
    }else{
      isSuccess = false;
      _errorMsg = response.errorMessage;
    }
    return isSuccess;
  }
}

import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/feature/auth/data/model/auth_controller.dart';
import 'package:crafty_bay/feature/auth/data/model/sign_in_request_model.dart';
import 'package:crafty_bay/feature/auth/data/model/user_model.dart';
import 'package:crafty_bay/feature/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  Future<bool> signIn(SignInRequestModel signInRequestModel) async {
    bool isSuccess = false;

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signInUrl,
      body: signInRequestModel.toJson(),
    );
    if(response.isSuccess){
      isSuccess =true;
      UserModel userModel = UserModel.fromJson(response.responseData!['data']['user']);
      String accessToken = response.responseData!['data']['token'];
      Get.find<AuthController>().saveUserData(accessToken, userModel);
      _errorMsg = '';
    }else{
      isSuccess = false;
      _errorMsg = response.errorMessage;
    }
    return isSuccess;
  }
}

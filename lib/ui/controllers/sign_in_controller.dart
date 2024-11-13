import 'package:get/get.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';

import '../../data/models/login_model.dart';
import '../../data/models/network_response.dart';

class SignInController extends GetxController {
  bool _signInApiInProgress = false;
  String _errorMessage = '';

  bool get signInApiInProgress => _signInApiInProgress;
  String get errorMassage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;


    Map<String, dynamic> requestData = {"email": email, "password": password};

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.login, body: requestData);
    _signInApiInProgress = false;

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? "Login failed Try again";
    }
    _signInApiInProgress = true;

    update();
    return isSuccess;
  }
}

import 'package:get/get.dart';
import 'package:hospitalapps/screens/LoginScreen.dart';
import 'package:hospitalapps/services/RegisterService.dart';

class RegisterController extends GetxController {
  RegisterService _registerService = RegisterService();

  void register({
    required String fullName,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    bool result = await _registerService.registerUser(
      fullName: fullName,
      nickname: nickname,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      role: role,
    );
    if (result == 201 || result == 200 || result == true) {
      Get.offAll(LoginScreen());
    } else {
      Get.snackbar('Registration Failed', 'Please try again later');
    }
  }
}

import 'package:get/get.dart';
import 'package:hospitalapps/screens/LoginScreen.dart';
import 'package:hospitalapps/services/RegisterService.dart';

class RegisterController extends GetxController {
  RegisterService _registerService = RegisterService();
  final RxString selectedRole = 'Pasien'.obs;
  List<String> roles = ['Pasien', 'Dokter'];

  void register({
    required String fullName,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    String rolesend = role.toLowerCase();
    bool result = await _registerService.registerUser(
      fullName: fullName,
      nickname: nickname,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      role: rolesend,
    );
    if (result == false) {
      Get.snackbar('Registration Failed', 'Please try again later');
    } else {
      Get.snackbar('Registration Success', 'Please login to continue');
      Get.offAll(LoginScreen());
    }
  }

  void changeSelectedRole(String? newRole) {
    if (newRole != null) {
      selectedRole.value = newRole;
    }
  }
}

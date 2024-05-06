// import 'package:get/get.dart';
// import 'package:hospitalapps/screens/LoginScreen.dart';
// import 'package:hospitalapps/services/RegisterService.dart';

// class RegisterController extends GetxController {
//   RegisterService _registerService = RegisterService();
//   final RxString selectedRole = 'Pasien'.obs;
//   List<String> roles = ['Pasien', 'Dokter'];

//   void register({
//     required String fullName,
//     required String nickname,
//     required String email,
//     required String phoneNumber,
//     required String password,
//     required String role,
//   }) async {
//     String rolesend = role.toLowerCase();
//     bool result = await _registerService.registerUser(
//       fullName: fullName,
//       nickname: nickname,
//       email: email,
//       phoneNumber: phoneNumber,
//       password: password,
//       role: rolesend,
//     );
//     if (result == false) {
//       Get.snackbar('Registration Failed', 'Please try again later');
//     } else {
//       Get.snackbar('Registration Success', 'Please login to continue');
//       Get.offAll(LoginScreen());
//     }
//   }

//   void changeSelectedRole(String? newRole) {
//     if (newRole != null) {
//       selectedRole.value = newRole;
//     }
//   }
// }

// Validasi kata sandi harus memiliki minimal 1 angka, 1 huruf, dan 1 simbol
// if (!_isValidPassword(password)) {
//   Get.snackbar('Invalid Password',
//       'Password must contain at least one digit, one letter, and one symbol');
//   return;
// }

// bool _isValidPassword(String password) {
//   // Minimal 8 karakter, minimal satu huruf, satu angka, dan satu karakter khusus
//   return RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
//       .hasMatch(password);
// }

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

    // Email Validation
    if (!_isValidEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address');
      return;
    }

    // Phone Number Validation
    if (!_isValidPhoneNumber(phoneNumber)) {
      Get.snackbar(
          'Invalid Phone Number', 'Please enter numbers only for phone number');
      return;
    }

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

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
  }
}

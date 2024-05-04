import 'package:get/get.dart';
import 'package:hospitalapps/screens/Doctors/HomeScreenDoctor.dart';
import 'package:hospitalapps/screens/Patients/HomeScreen.dart';
import 'package:hospitalapps/services/LoginService.dart';

class LoginController extends GetxController {
  final LoginService _apiService = LoginService();

  void loginUser(String email, String password) async {
    var result = await _apiService.loginUser(email, password);
    if (result != null && result['loggedIn'] == true) {
      switch (result['role']) {
        case 'pasien':
          Get.offAll(() => HomeScreen());
          break;
        case 'dokter':
          Get.offAll(() => HomeScreenDoctor());
          break;
        default:
          Get.snackbar('Error', 'Role not recognized');
          break;
      }
    } else {
      Get.snackbar('Error', 'Login failed. Please check your credentials.');
    }
  }
}

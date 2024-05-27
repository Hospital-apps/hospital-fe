import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://10.20.152.152:3000/api/auth/login',
        // 'http://172.20.10.2:3000/api/auth/login',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200 && response.data['status'] == 200) {
        String token = response.data['data']['token'];
        String role = response.data['data']['role'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return {"loggedIn": true, "role": role};
      }
      return {"loggedIn": false};
    } catch (e) {
      print(e);
      return {"loggedIn": false};
    }
  }
}

import 'package:dio/dio.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<bool> registerUser({
    required String fullName,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:3000/api/auth/register',
        data: {
          "fullName": fullName,
          "nickname": nickname,
          "email": email,
          "phoneNumber": phoneNumber,
          "password": password,
          "role": role,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print('Registration Error: $e');
      return false;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:hospitalapps/models/Doctor.dart';

class DoctorService {
  final Dio _dio = Dio();

  Future<List<Doctor>> fetchDoctors() async {
    try {
      await TokenManager.init();

      String? token = TokenManager.getToken();

      _dio.options.headers['Authorization'] = 'Bearer $token';

      // Make the request
      final response = await _dio.get('http://10.0.2.2:3000/api/doctors');
      return (response.data as List)
          .map((doc) => Doctor.fromJson(doc))
          .toList();
    } catch (e) {
      print('Error fetching doctors: $e');
      return [];
    }
  }
}

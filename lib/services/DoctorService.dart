import 'package:dio/dio.dart';
import 'package:hospitalapps/models/Doctor.dart';

class DoctorService {
  final Dio _dio = Dio();

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await _dio.get('http://10.0.2.2:3000/api/doctors');
      return doctorFromJson(response.data);
    } catch (e) {
      print('Error fetching doctors: $e');
      return [];
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleService {
  final Dio _dio = Dio();

  ScheduleService() {
    _dio.options.baseUrl = 'http://10.0.2.2:3000/api/doctors/';
  }

  Future<String?> getDoctorId() async {
    String? token = await getToken();
    if (token != null) {
      return TokenManager.decodeToken(token);
    }
    return null;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> saveDoctorInformation({
    required String day,
    required List<Map<String, String>> timeSlots,
    required String specialty,
  }) async {
    String? doctorId = await getDoctorId();
    if (doctorId != null) {
      String? token = await getToken();
      if (token != null) {
        try {
          Response response = await _dio.post(
            '/schedule/$doctorId',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
            data: {
              'day': day,
              'timeSlots': timeSlots,
              'specialty': specialty,
            },
          );
          print('Response status: ${response.statusCode}');
          print('Response data: ${response.data}');
        } catch (e) {
          print('Error saving doctor information: $e');
          throw e;
        }
      } else {
        throw Exception('Token not found');
      }
    } else {
      throw Exception('Doctor ID not found');
    }
  }
}

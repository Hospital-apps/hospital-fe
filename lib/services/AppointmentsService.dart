import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:hospitalapps/models/Appointments.dart';
import 'package:hospitalapps/models/AppointmentsDetail.dart';

class AppointmentService {
  final Dio _dio = Dio();

  Future<bool> createAppointment({
    required String patientId,
    required String doctorId,
    required String specialty,
    required String time,
    required String day,
    required String status,
    required String type,
    required String package,
  }) async {
    try {
      String? token = TokenManager.getToken();
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.post(
        'http://10.24.250.2:3000/api/appointments',
        data: {
          'patientId': patientId,
          'doctorId': doctorId,
          'specialty': specialty,
          'time': time,
          'day': day,
          'status': status,
          'type': type,
          'package': package,
        },
      );

      if (response.statusCode == 201) {
        log('appointments created');
        return true;
      }
      return false;
    } catch (e) {
      print('Error creating appointment: $e');
      return false;
    }
  }

  Future<List<Appointment>> fetchAppointments() async {
    try {
      String? token = TokenManager.getToken();
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response =
          await _dio.get('http://10.24.250.2:3000/api/appointments/info');
      log(response.data.toString());
      return (response.data as List)
          .map((data) => Appointment.fromJson(data))
          .toList();
    } catch (e) {
      print('Error fetching appointments: $e');
      return [];
    }
  }

  // Future<Appointment> getAppointmentDetails(String id) async {
  //   try {
  //     String? token = TokenManager.getToken();
  //     _dio.options.headers['Authorization'] = 'Bearer $token';

  //     final response =
  //         await _dio.get('http://10.0.2.2:3000/api/appointments/details/$id');
  //     if (response.statusCode == 200) {
  //       return Appointment.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to load appointment details');
  //     }
  //   } catch (e) {
  //     print('Error fetching appointment details: $e');
  //     throw Exception('Failed to fetch appointment details');
  //   }
  // }

  Future<AppointmentDetails?> fetchAppointmentDetails(
      String appointmentId) async {
    try {
      String? token = TokenManager.getToken();
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(
          'http://10.24.250.2:3000/api/appointments/details/$appointmentId');
      if (response.statusCode == 200 && response.data != null) {
        var data =
            response.data['data']; // Access the nested 'data' key directly
        if (data != null) {
          return AppointmentDetails.fromJson(data);
        } else {
          throw Exception("Data not found in response");
        }
      } else {
        throw Exception('Failed to load appointment details');
      }
    } catch (e) {
      print('Error fetching appointment details: $e');
      throw Exception('Failed to fetch appointment details');
    }
  }
}

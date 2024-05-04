import 'package:dio/dio.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:hospitalapps/models/Appointments.dart';

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
        'http://10.0.2.2:3000/api/appointments',
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
      await TokenManager.init();

      String? token = TokenManager.getToken();

      _dio.options.headers['Authorization'] = 'Bearer $token';

      // Make the request
      final response =
          await _dio.get('http://10.0.2.2:3000/api/appointments/info');
      return (response.data as List)
          .map((data) => Appointment.fromJson(data))
          .toList();
    } catch (e) {
      print('Error fetching appointments: $e');
      return [];
    }
  }
}

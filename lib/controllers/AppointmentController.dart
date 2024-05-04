import 'package:get/get.dart';
import 'package:hospitalapps/models/Appointments.dart';
import 'package:hospitalapps/services/AppointmentsService.dart';

class MyAppointmentController extends GetxController {
  var appointments = <Appointment>[].obs;
  final AppointmentService _appointmentService = AppointmentService();

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  void fetchAppointments() async {
    appointments.value = await _appointmentService.fetchAppointments();
  }
}

import 'dart:developer';

import 'package:get/get.dart';
import 'package:hospitalapps/models/Appointments.dart';
import 'package:hospitalapps/models/AppointmentsDetail.dart';
import 'package:hospitalapps/services/AppointmentsService.dart';

class AppointmentController extends GetxController {
  final AppointmentService _appointmentService = AppointmentService();
  final RxList<Appointment> appointments = <Appointment>[].obs;
  // var isLoading = false.obs;
  // var currentAppointment = Rxn<Appointment>();
  Rx<AppointmentDetails?> currentAppointment2 = Rx<AppointmentDetails?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  void fetchAppointments() async {
    var fetchedAppointments = await _appointmentService.fetchAppointments();
    appointments.assignAll(fetchedAppointments);
    log('fetch appointments');
    // isLoading(true);
    // try {
    //   var fetchedAppointments = await _appointmentService.fetchAppointments();
    //   if (fetchedAppointments.isNotEmpty) {
    //     appointments.assignAll(fetchedAppointments);
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }

  void fetchAppointmentDetails(String appointmentId) async {
    var appointment =
        await _appointmentService.fetchAppointmentDetails(appointmentId);
    currentAppointment2.value = appointment as AppointmentDetails?;
  }
}

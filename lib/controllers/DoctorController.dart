import 'package:get/get.dart';
import 'package:hospitalapps/models/Doctor.dart';
import 'package:hospitalapps/services/DoctorService.dart';

class DoctorController extends GetxController {
  var selectedDoctor = Rxn<Doctor>();
  var selectedSchedule = Rxn<Schedule>();
  var selectedTimeSlot = Rxn<TimeSlot>();

  void selectDoctor(Doctor doctor) {
    selectedDoctor.value = doctor;
    selectedSchedule.value =
        doctor.schedules.isNotEmpty ? doctor.schedules.first : null;
    update();
  }

  void selectSchedule(Schedule schedule) {
    selectedSchedule.value = schedule;
    // Maybe you need to select a default time slot or clear previous selections
    update();
  }
}

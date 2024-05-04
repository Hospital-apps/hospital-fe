import 'package:get/get.dart';
import 'package:hospitalapps/models/Doctor.dart';
import 'package:hospitalapps/services/DoctorService.dart';

class ConsultationController extends GetxController {
  final DoctorService doctorService = DoctorService();

  var doctors = <Doctor>[].obs;
  var selectedDoctor = Rx<Doctor?>(null);
  var selectedDay = Rx<Schedule?>(null);
  var selectedTime = Rx<TimeSlot?>(null);
  var selectedType = 'Offline Consultation'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndSetDoctors();
  }

  void fetchAndSetDoctors() async {
    var fetchedDoctors = await doctorService.fetchDoctors();
    if (fetchedDoctors.isNotEmpty) {
      doctors.value = fetchedDoctors;
      selectedDoctor.value = doctors.first;
      if (selectedDoctor.value!.schedules.isNotEmpty) {
        selectedDay.value = selectedDoctor.value!.schedules.first;
        if (selectedDay.value!.timeSlots.isNotEmpty) {
          selectedTime.value = selectedDay.value!.timeSlots.first;
        }
      }
    }
  }

  void changeSelectedDoctor(Doctor doctor) {
    selectedDoctor.value = doctor;
    if (doctor.schedules.isNotEmpty) {
      selectedDay.value = doctor.schedules.first;
      if (selectedDay.value!.timeSlots.isNotEmpty) {
        selectedTime.value = selectedDay.value!.timeSlots.first;
      } else {
        selectedTime.value = null;
      }
    } else {
      selectedDay.value = null;
      selectedTime.value = null;
    }
  }

  void changeSelectedDay(Schedule schedule) {
    selectedDay.value = schedule;
    if (schedule.timeSlots.isNotEmpty) {
      selectedTime.value = schedule.timeSlots.first;
    } else {
      selectedTime.value = null;
    }
  }

  void changeSelectedTime(TimeSlot timeSlot) {
    selectedTime.value = timeSlot;
  }

  void changeSelectedType(String type) {
    selectedType.value = type;
  }
}

import 'package:get/get.dart';
import 'package:hospitalapps/models/Doctor.dart';
import 'package:hospitalapps/services/DoctorService.dart';

class DoctorController extends GetxController {
  final DoctorService doctorService = DoctorService();
  final RxList<Doctor> doctors = <Doctor>[].obs;
  final Rx<Doctor?> selectedDoctor = Rx<Doctor?>(null);
  final RxList<String> availableTimes = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndSetDoctors();
  }

  void fetchAndSetDoctors() async {
    var fetchedDoctors = await doctorService.fetchDoctors();
    if (fetchedDoctors.isNotEmpty) {
      doctors.addAll(fetchedDoctors);
      selectedDoctor.value = doctors.first;
      updateAvailableTimes();
    }
  }

  void changeSelectedDoctor(Doctor doctor) {
    selectedDoctor.value = doctor;
    updateAvailableTimes();
  }

  void updateAvailableTimes() {
    availableTimes.clear();
    selectedDoctor.value?.schedule.forEach((day) {
      day.timeSlots.forEach((slot) {
        availableTimes.add('${slot.start} - ${slot.end}');
      });
    });
  }
}

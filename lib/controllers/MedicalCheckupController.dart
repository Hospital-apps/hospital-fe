import 'package:hospitalapps/services/MedicalCheckupService.dart';

class MedicalCheckupController {
  MedicalCheckupService _service = MedicalCheckupService();

  void makeAppointment(DateTime date, String package) {
    _service.makeAppointment(date, package);
  }

  List<Appointment> getAppointments() {
    return _service.getAppointments();
  }
}

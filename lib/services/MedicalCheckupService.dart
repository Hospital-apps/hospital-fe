class MedicalCheckupService {
  List<Appointment> appointments = [];

  void makeAppointment(DateTime date, String package) {
    appointments.add(Appointment(date, package));
  }

  List<Appointment> getAppointments() {
    return appointments;
  }
}

class Appointment {
  final DateTime date;
  final String package;

  Appointment(this.date, this.package);
}

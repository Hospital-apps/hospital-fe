class Appointment {
  final String id;
  final Doctor doctor;
  final String time;
  final String day;
  final String status;
  final String type;

  Appointment({
    required this.id,
    required this.doctor,
    required this.time,
    required this.day,
    required this.status,
    required this.type,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      doctor: Doctor.fromJson(json['doctorId']),
      time: json['time'],
      day: json['day'],
      status: json['status'],
      type: json['type'],
    );
  }
}

class Doctor {
  final String id;
  final String fullName;
  final String specialty;

  Doctor({
    required this.id,
    required this.fullName,
    required this.specialty,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'],
      fullName: json['fullName'],
      specialty: json['specialty'],
    );
  }
}

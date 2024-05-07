// models/history.dart
class History {
  final String id;
  final String patientId;
  final Doctor doctor;
  final String specialty;
  final String time;
  final String day;
  final String status;
  final String type;
  final String package;
  final DateTime createdAt;

  History({
    required this.id,
    required this.patientId,
    required this.doctor,
    required this.specialty,
    required this.time,
    required this.day,
    required this.status,
    required this.type,
    required this.package,
    required this.createdAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        patientId: json["patientId"],
        doctor: Doctor.fromJson(json["doctorId"]),
        specialty: json["specialty"],
        time: json["time"],
        day: json["day"],
        status: json["status"],
        type: json["type"],
        package: json["package"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
}

class Doctor {
  final String id;
  final String fullName;
  final String specialty;

  Doctor({required this.id, required this.fullName, required this.specialty});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        fullName: json["fullName"],
        specialty: json["specialty"],
      );
}

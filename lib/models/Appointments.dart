class Appointment {
  final String id;
  final String doctorId;
  final String specialty;
  final String time;
  final String day;
  final String status;
  final String type;
  final String package;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.specialty,
    required this.time,
    required this.day,
    required this.status,
    required this.type,
    required this.package,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["_id"],
      doctorId: json["doctorId"],
      specialty: json["specialty"],
      time: json["time"],
      day: json["day"],
      status: json["status"],
      type: json["type"],
      package: json["package"],
    );
  }
}

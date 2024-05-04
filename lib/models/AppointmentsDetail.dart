class AppointmentDetails {
  final String id;
  final String patientId;
  final Doctor doctor;
  final String specialty;
  final String time;
  final String day;
  final String status;
  final String type;
  final String package;
  final bool isApproved;

  AppointmentDetails({
    required this.id,
    required this.patientId,
    required this.doctor,
    required this.specialty,
    required this.time,
    required this.day,
    required this.status,
    required this.type,
    required this.package,
    required this.isApproved,
  });

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) {
    return AppointmentDetails(
      id: json['_id'],
      patientId: json['patientId'],
      doctor: Doctor.fromJson(json['doctorId']),
      specialty: json['specialty'],
      time: json['time'],
      day: json['day'],
      status: json['status'],
      type: json['type'],
      package: json['package'],
      isApproved: json['isApproved'],
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

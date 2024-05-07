class AppointmentDetails {
  final String id;
  final String patientId;
  final String doctor;
  final String specialty;
  final String time;
  final String day;
  final String status;
  final String type;
  final String package;
  final bool isApproved;
  final String linkGMeet;

  AppointmentDetails({
    required this.id,
    required this.patientId,
    required this.doctor,
    required this.specialty,
    required this.time,
    required this.day,
    required this.status,
    required this.type,
    this.package = '',
    required this.isApproved,
    this.linkGMeet = '',
  });

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) {
    return AppointmentDetails(
      id: json['_id'] as String,
      patientId: json['patientId'] as String,
      doctor:
          Doctor.fromJson(json['doctorId'] as Map<String, dynamic>).fullName,
      specialty: json['specialty'] as String,
      time: json['time'] as String,
      day: json['day'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      package: json['package'] as String? ?? '',
      isApproved: json['isApproved'] == 'true',
      linkGMeet: json['link_gmeet'] as String? ?? '',
    );
  }
}

class Doctor {
  final String id;
  final String fullName;

  Doctor({required this.id, required this.fullName});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
    );
  }
}

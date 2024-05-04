class Doctor {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String specialty;
  final List<Schedule> schedules;

  Doctor({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.specialty,
    required this.schedules,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      specialty: json['specialty'],
      schedules: List<Schedule>.from(
          json['schedule'].map((s) => Schedule.fromJson(s))),
    );
  }
}

class Schedule {
  final String day;
  final List<TimeSlot> timeSlots;

  Schedule({required this.day, required this.timeSlots});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      day: json['day'],
      timeSlots: List<TimeSlot>.from(
          json['timeSlots'].map((t) => TimeSlot.fromJson(t))),
    );
  }
}

class TimeSlot {
  final String start;
  final String end;
  final String id;

  TimeSlot({required this.start, required this.end, required this.id});

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      start: json['start'],
      end: json['end'],
      id: json['_id'],
    );
  }
}

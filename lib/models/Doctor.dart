import 'dart:convert';

List<Doctor> doctorFromJson(String str) =>
    List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

class Doctor {
  String id;
  String fullName;
  String specialty;
  List<Schedule> schedule;

  Doctor({
    required this.id,
    required this.fullName,
    required this.specialty,
    required this.schedule,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        fullName: json["fullName"],
        specialty: json["specialty"],
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
      );
}

class Schedule {
  String day;
  List<TimeSlot> timeSlots;

  Schedule({
    required this.day,
    required this.timeSlots,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
        timeSlots: List<TimeSlot>.from(
            json["timeSlots"].map((x) => TimeSlot.fromJson(x))),
      );
}

class TimeSlot {
  String start;
  String end;

  TimeSlot({
    required this.start,
    required this.end,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        start: json["start"],
        end: json["end"],
      );
}

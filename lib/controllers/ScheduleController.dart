import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:hospitalapps/services/SheduleService.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ScheduleController {
  final ScheduleService _scheduleService = ScheduleService();
  Future<void> saveDoctorInformation({
    required String day,
    required List<Map<String, String>> timeSlots,
    required String specialty,
  }) async {
    try {
      await _scheduleService.saveDoctorInformation(
        day: day,
        timeSlots: timeSlots,
        specialty: specialty,
      );
      // Get.snackbar(
      //   'Success',
      //   'Doctor information saved successfully',
      //   snackPosition: SnackPosition.BOTTOM,
      //   duration: Duration(seconds: 3),
      // );
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Failed to save doctor information: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   duration: Duration(seconds: 3),
      // );
    }
  }
}

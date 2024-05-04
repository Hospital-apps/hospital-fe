import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/ConsultationController.dart';
import 'package:hospitalapps/models/Doctor.dart';

class Consultation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationController());

    return Scaffold(
      appBar: AppBar(title: Text('Consultation Booking')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Doctor',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<Doctor>(
                  isExpanded: true,
                  value: controller.selectedDoctor.value,
                  onChanged: (newValue) =>
                      controller.changeSelectedDoctor(newValue!),
                  items: controller.doctors.map((Doctor doc) {
                    return DropdownMenuItem<Doctor>(
                      value: doc,
                      child: Text('${doc.fullName} - ${doc.specialty}'),
                    );
                  }).toList(),
                )),
            SizedBox(height: 20),
            Text('Select Day',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<Schedule>(
                  isExpanded: true,
                  value: controller.selectedDay.value,
                  onChanged: (newValue) =>
                      controller.changeSelectedDay(newValue!),
                  items: controller.selectedDoctor.value?.schedules
                          .map((Schedule schedule) {
                        return DropdownMenuItem<Schedule>(
                          value: schedule,
                          child: Text(schedule.day),
                        );
                      })?.toList() ??
                      [],
                )),
            SizedBox(height: 20),
            Text('Select Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<TimeSlot>(
                  isExpanded: true,
                  value: controller.selectedTime.value,
                  onChanged: (newValue) =>
                      controller.changeSelectedTime(newValue!),
                  items: controller.selectedDay.value?.timeSlots
                          .map((TimeSlot slot) {
                        return DropdownMenuItem<TimeSlot>(
                          value: slot,
                          child: Text('${slot.start} - ${slot.end}'),
                        );
                      })?.toList() ??
                      [],
                )),
            SizedBox(height: 20),
            Text('Select Consultation Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedType.value,
                  onChanged: (newValue) =>
                      controller.changeSelectedType(newValue!),
                  items: ['Offline Consultation', 'Online Consultation']
                      .map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.createAppointment(),
              child: const Text('Make Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/AppointmentController.dart';
import 'package:hospitalapps/screens/Patients/DetailConsultScreen.dart';
import 'package:hospitalapps/screens/Patients/DetailMedCheckScreen.dart';

class MyAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.put(AppointmentController());
    log('BUILD');
    appointmentController.fetchAppointments();
    final appointmentsList = appointmentController.appointments;
    return Scaffold(
        body: ListView.builder(
            itemCount: appointmentsList.length,
            reverse: true,
            itemBuilder: ((context, index) {
              final appointment = appointmentsList[index];
              return ConsultationCard(
                doctorName: appointment.doctor.fullName,
                day: appointment.day,
                time: "${appointment.time}",
                status: appointment.status,
                appointmentId: appointment.id,
              );
            }))
        // SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       SizedBox(height: 20),
        //       Obx(() {
        //         if (appointmentController.appointments.isEmpty) {
        //           return Text("Loading appointments...");
        //         }
        //         return Column(
        //           children: appointmentController.appointments.map((appointment) {
        //             return Padding(
        //               padding: const EdgeInsets.only(bottom: 20),
        //               child: ConsultationCard(
        //                 doctorName: appointment.doctor.fullName,
        //                 day: appointment.day,
        //                 time: "${appointment.time}",
        //                 status: appointment.status,
        //                 appointmentId: appointment.id,
        //               ),
        //             );
        //           }).toList(),
        //         );
        //       }),
        //       SizedBox(height: 20),
        //       // Example of a MedCheck card if relevant
        //       MedCheckCard(
        //         package: 'Package 1',
        //         date: 'April, 30th 2024',
        //       ),
        //     ],
        //   ),
        // ),

        );
  }
}

class ConsultationCard extends StatelessWidget {
  final String doctorName;
  final String day;
  final String time;
  final String status;
  final String appointmentId;

  ConsultationCard({
    required this.doctorName,
    required this.day,
    required this.time,
    required this.status,
    required this.appointmentId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctorName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 4),
            Text('Day: $day', style: TextStyle(fontSize: 16)),
            SizedBox(height: 2),
            Text('Time: $time', style: TextStyle(fontSize: 16)),
            SizedBox(height: 2),
            Text('Status: $status',
                style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: _buildActionButton(status, appointmentId, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      String status, String appointmentId, BuildContext context) {
    String buttonText = 'Detail';
    VoidCallback? onPressed;

    switch (status.toLowerCase()) {
      case 'pending':
        buttonText = 'Pending';
        onPressed = null;
        break;
      case 'started':
        buttonText = 'Detail';
        onPressed = () {
          Get.find<AppointmentController>()
              .fetchAppointmentDetails(appointmentId);
          Get.to(() => DetailConsultationScreen());
        };
        break;
      case 'finished':
        buttonText = 'Finished';
        onPressed = null;
        break;
      default:
        buttonText = 'Unknown';
        onPressed = null;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(buttonText),
    );
  }
}

class MedCheckCard extends StatelessWidget {
  final String package;
  final String date;

  MedCheckCard({
    required this.package,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text('Date: $date', style: TextStyle(fontSize: 16)),
            Align(
              alignment: Alignment.centerRight,
              child: DetailMedCheckBtn(),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailConsultBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailConsultationScreen()),
        );
      },
      child: Text('Detail'),
    );
  }
}

class DetailMedCheckBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailMedCheckScreen()),
        );
      },
      child: Text('Detail'),
    );
  }
}

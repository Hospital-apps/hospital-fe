import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/AppointmentController.dart';

class DetailConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppointmentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Detail Consultation')),
      body: Obx(() {
        final appointment = controller.currentAppointment.value;
        if (appointment == null) return CircularProgressIndicator();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_3_rounded, size: 50),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctor.fullName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        appointment.day,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "${appointment.time}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        appointment.type,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              JoinMeetBtn(),
              FinishBtn(),
            ],
          ),
        );
      }),
    );
  }
}

class JoinMeetBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Join Meet'),
    );
  }
}

class FinishBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Finish'),
    );
  }
}

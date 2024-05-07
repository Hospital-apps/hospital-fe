import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/AppointmentController.dart';
import 'package:hospitalapps/models/AppointmentsDetail.dart';
import 'package:hospitalapps/widgets/JoinMeetScreen.dart';

class DetailConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppointmentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Consultation'),
        // backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        final appointment = controller.currentAppointment2.value;
        if (appointment == null) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppointmentInfo(appointment),
              SizedBox(height: 20),
              _buildActionButtons(appointment),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildAppointmentInfo(AppointmentDetails appointment) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person, size: 50),
              title: Text(
                appointment.doctor ?? 'No Doctor Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Day: ${appointment.day ?? 'No Day'}'),
                  Text('Time: ${appointment.time ?? 'No Time'}'),
                  Text('Type: ${appointment.type ?? 'No Type'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(AppointmentDetails appointment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: JoinMeetBtn(
              meetLink: appointment.linkGMeet), // Passing the meet link
        ),
        SizedBox(width: 10), // Adds space between the buttons
        Expanded(
          child: ElevatedButton(
            onPressed: () {}, // Implement your finish functionality here
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            child: Text('Finish'),
          ),
        ),
      ],
    );
  }
}

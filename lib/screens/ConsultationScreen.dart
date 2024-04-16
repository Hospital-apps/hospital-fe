import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => ConsultationState();
}

class ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Consultation'),
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('Select Specialist'),
            Text('Select Doctor'),
            Text('Select Date'),
            Text('Select Consultation Type'),
            MakeAppointmentButton()
          ]),
        ));
  }
}

class MakeAppointmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika logout di sini
        print('Appointment created');
      },
      child: Text('Make Appointment'),
    );
  }
}

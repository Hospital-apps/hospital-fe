import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: (HistoryAppointment()),
    );
  }
}

class HistoryAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
// Background Container
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          height: 200,
        ),
        // Doctor Name, Date, Time, and Consultation Status
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. John Doe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Date: April 12, 2024',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Time: 10:00 AM - 11:00 AM',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Status: Online Consult',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              ConsultAgainBtn()
            ],
          ),
        ),
      ],
    );
  }
}

class ConsultAgainBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika logout di sini
        print('Consult Again');
      },
      child: Text('Consult Again'),
    );
  }
}

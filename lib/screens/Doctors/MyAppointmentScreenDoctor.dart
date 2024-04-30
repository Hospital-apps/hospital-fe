import 'package:flutter/material.dart';

class MyAppointmentDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ConsultationCardLink(
              patientName: 'Stephanie',
              age: '20 years old',
              date: 'April 12, 2024',
              time: '10:00 AM - 11:00 AM',
              status: 'Online Consult',
            ),
            SizedBox(height: 20),
            ConsultationCardAccRej(
              patientName: 'Stephanie',
              age: '20 years old',
              date: 'April 12, 2024',
              time: '10:00 AM - 11:00 AM',
              status: 'Online Consult',
            ),
            ConsultationCardDetail(
              patientName: 'Stephanie',
              age: '20 years old',
              date: 'April 12, 2024',
              time: '10:00 AM - 11:00 AM',
              status: 'Online Consult',
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationCardLink extends StatelessWidget {
  final String patientName;
  final String age;
  final String date;
  final String time;
  final String status;

  ConsultationCardLink({
    required this.patientName,
    required this.age,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 250,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_3_rounded,
                  size: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      age,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Date: $date',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Time: $time',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Status: $status',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    InputLinkBtn()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationCardAccRej extends StatelessWidget {
  final String patientName;
  final String age;
  final String date;
  final String time;
  final String status;

  ConsultationCardAccRej({
    required this.patientName,
    required this.age,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 250,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_3_rounded,
                  size: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      age,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Date: $date',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Time: $time',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Status: $status',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AcceptBtn(), RejectBtn()],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationCardDetail extends StatelessWidget {
  final String patientName;
  final String age;
  final String date;
  final String time;
  final String status;

  ConsultationCardDetail({
    required this.patientName,
    required this.age,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 250,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_3_rounded,
                  size: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      age,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Date: $date',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Time: $time',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Status: $status',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    DetailConsultBtn()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailConsultBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Detail Appointment');
      },
      child: Text('Detail'),
    );
  }
}

class AcceptBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Detail Appointment');
      },
      child: Text('Accept'),
    );
  }
}

class RejectBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Detail Appointment');
      },
      child: Text('Reject'),
    );
  }
}

class InputLinkBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Input Link'),
    );
  }
}

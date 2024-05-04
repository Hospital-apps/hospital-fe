import 'package:flutter/material.dart';

class DetailConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Consultation')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      'dr. Jake Sim',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'April 12, 2024',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '08:00 AM - 11:00 AM',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Online Consult',
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
      ),
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

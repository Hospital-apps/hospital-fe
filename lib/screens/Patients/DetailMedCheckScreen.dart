import 'package:flutter/material.dart';

class DetailMedCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Medical Checkup')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.note,
                  size: 50,
                ),
                SizedBox(width: 10),
                Text(
                  'package 1',
                  style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                ),
              ],
            ),
            Text(
              'April, 30th 2024',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
    );
  }
}

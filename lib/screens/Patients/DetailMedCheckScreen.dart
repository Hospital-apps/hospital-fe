import 'package:flutter/material.dart';

class DetailConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                Icons.person_3_rounded,
                size: 50,
              ),
              SizedBox(width: 10),
              SizedBox(height: 20),
              MedCheckCard(
                package: 'package 1',
                date: 'April, 30th 2024',
              )
            ]),
          ],
        ),
      ),
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 150,
          ),
          Positioned(
              top: 20,
              left: 20,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.person_3_rounded,
                  size: 50,
                ),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    package,
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
                ])
              ]))
        ]));
  }
}

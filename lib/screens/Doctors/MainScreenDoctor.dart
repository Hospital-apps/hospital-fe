import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapps/screens/Doctors/MyAppointmentScreenDoctor.dart';
import 'package:hospitalapps/screens/Doctors/PackageScreen.dart';

class MainScreenDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, username!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.red[500],
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Appointment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyAppointmentDoctor()),
                  );
                },
                child: const Text('All'),
              ),
              const SizedBox(height: 30),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ConsultationCard(
                  patientName: 'Stephanie',
                  age: '20 years old',
                  date: 'April 12, 2024',
                  time: '10:00 AM - 11:00 AM',
                  status: 'Online Consult',
                ),
                SizedBox(height: 20),
                ConsultationCard(
                  patientName: 'Stephanie',
                  age: '20 years old',
                  date: 'April 12, 2024',
                  time: '10:00 AM - 11:00 AM',
                  status: 'Online Consult',
                ),
                SizedBox(height: 20),
                ConsultationCard(
                  patientName: 'Stephanie',
                  age: '20 years old',
                  date: 'April 12, 2024',
                  time: '10:00 AM - 11:00 AM',
                  status: 'Online Consult',
                ),
                SizedBox(height: 20),
                ConsultationCard(
                  patientName: 'Stephanie',
                  age: '20 years old',
                  date: 'April 12, 2024',
                  time: '10:00 AM - 11:00 AM',
                  status: 'Online Consult',
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Package",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PackageScreen()),
                    );
                  },
                  child: const Text('All'),
                ),
                const SizedBox(height: 30),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.7,
                initialPage: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                'assets/img/package1.jpg',
                'assets/img/package2.jpg',
              ].map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationCard extends StatelessWidget {
  final String patientName;
  final String age;
  final String date;
  final String time;
  final String status;

  ConsultationCard({
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
            height: 200,
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

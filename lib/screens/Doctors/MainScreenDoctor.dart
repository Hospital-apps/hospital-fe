import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapps/screens/Doctors/MyAppointmentScreenDoctor.dart';
import 'package:hospitalapps/screens/Doctors/PackageScreen.dart';

class MainScreenDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildHeader(context),
            const Divider(),
            SectionTitle(
                title: "Appointment",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAppointmentDoctor()));
                }),
            ConsultationList(),
            SectionTitle(
                title: "Package",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PackageScreen()));
                }),
            PackageCarousel(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Hello, username!",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: Icon(Icons.notifications,
              color: Theme.of(context).colorScheme.secondary),
          iconSize: 30,
          onPressed: () {},
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  SectionTitle({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('All'),
          ),
        ],
      ),
    );
  }
}

class ConsultationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          4,
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ConsultationCard(
                  patientName: 'Stephanie',
                  age: '20 years old',
                  date: 'April 12, 2024',
                  time: '10:00 AM - 11:00 AM',
                  status: 'Online Consult',
                ),
              )),
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(patientName, style: Theme.of(context).textTheme.headline6),
            Text(age, style: Theme.of(context).textTheme.subtitle1),
            Text('Date: $date', style: Theme.of(context).textTheme.bodyText1),
            Text('Time: $time', style: Theme.of(context).textTheme.bodyText1),
            Text('Status: $status',
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Accept')),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: Text('Reject')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        viewportFraction: 0.8,
        initialPage: 0,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

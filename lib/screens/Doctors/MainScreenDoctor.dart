import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapps/screens/Doctors/AddDoctorListScreen.dart';
import 'package:hospitalapps/screens/Doctors/AddPackageScreen.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavIconButton(
                  iconPath: 'assets/img/doctorList.png',
                  label: 'Add Doctor Information',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddDoctorList()),
                    );
                  },
                ),
                NavIconButton(
                  iconPath: 'assets/img/package.png',
                  label: 'Add Package',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPackage()),
                    );
                  },
                ),
              ],
            ),
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
                child: ConsultationCardDetail(
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

class NavIconButton extends StatelessWidget {
  final String iconPath;
  final Function()? onPressed;

  const NavIconButton({
    required this.iconPath,
    required this.onPressed,
    required String label,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        iconPath,
        width: 40,
        height: 40,
      ),
      onPressed: onPressed,
    );
  }
}

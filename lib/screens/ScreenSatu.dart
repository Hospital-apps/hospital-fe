import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapps/screens/ConsultationScreen.dart';
import 'package:hospitalapps/screens/DoctorScheduleScreen.dart';
import 'package:hospitalapps/screens/HistoryScreen.dart';
import 'package:hospitalapps/screens/MedCheckScreen.dart';

class ScreenSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavIconButton(
                  iconPath: 'assets/img/doctor.png',
                  label: 'Consultation',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Consultation()), // Ganti DoctorPage dengan halaman yang sesuai
                    );
                  },
                ),
                NavIconButton(
                  iconPath: 'assets/img/examination.png',
                  label: 'Medical Checkup',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MedicalCheckupScreen()), // Ganti DoctorPage dengan halaman yang sesuai
                    );
                  },
                ),
                NavIconButton(
                  iconPath: 'assets/img/schedule.png',
                  label: 'Doctor Schedule',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DoctorSchedule()), // Ganti DoctorPage dengan halaman yang sesuai
                    );
                  },
                ),
                NavIconButton(
                  iconPath: 'assets/img/ambulance.png',
                  label: 'Ambulance',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Consultation()), // Ganti DoctorPage dengan halaman yang sesuai
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return ConsultationCard(
                  doctorName: 'dr. Jake Sim',
                  specialty: 'Pediatrician',
                  onPressed: () {
                    print('Consultation Started');
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              "Advertisement",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Carousel
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
                'assets/img/ads1.png',
                'assets/img/ads2.png',
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

class ConsultationCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final Function()? onPressed;

  const ConsultationCard({
    required this.doctorName,
    required this.specialty,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    doctorName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text('Start Consultation'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class StartConsult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         print('Consultation Started');
//       },
//       child: Text('Start Consultation'),
//     );
//   }
// }


  // import 'package:flutter/material.dart';

  // class ScreenSatu extends StatelessWidget {
  //   const ScreenSatu({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Center(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text("Hello. username!"),
  //                 Icon(
  //                   Icons.notifications,
  //                   color: Colors.red[500],
  //                 )
  //               ],
  //             ),
  //             Divider(),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Text("Consultation"),
  //                 Text("Medical Checkup"),
  //                 Text("Doctor Schedule"),
  //                 Text("Ambulance")
  //               ],
  //             ),
  //             Divider(),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [],
  //             ),
  //             Divider(),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Advertisement"),
  //                 Image.asset(
  //                   'assets/img/ads1.png',
  //                   width: 500,
  //                   height: 250,
  //                 ),
  //                 Image.asset(
  //                   'assets/img/ads2.png',
  //                   width: 500,
  //                   height: 250,
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }

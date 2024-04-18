import 'package:flutter/material.dart';

class ScreenSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello. username!"),
                Icon(
                  Icons.notifications,
                  color: Colors.red[500],
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img/doctor.png'),
                  iconSize: 10,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/img/examination.png'),
                  iconSize: 10,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/img/schedule.png'),
                  iconSize: 10,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/img/ambulance.png'),
                  iconSize: 10,
                  onPressed: () {},
                )
              ],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 300,
                      height: 150,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'dr. Jake Sim',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Pediatrician',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                StartConsult()
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 300,
                      height: 150,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'dr. Jake Sim',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Pediatrician',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                StartConsult()
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 300,
                      height: 150,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'dr. Jake Sim',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Pediatrician',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                StartConsult()
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Advertisement"),
                Image.asset(
                  'assets/img/ads1.png',
                  width: 500,
                  height: 250,
                ),
                Image.asset(
                  'assets/img/ads2.png',
                  width: 500,
                  height: 250,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StartConsult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika logout di sini
        print('Consultation Started');
      },
      child: Text('Start Consultation'),
    );
  }
}

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

import 'package:flutter/material.dart';

class ScreenSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Screen"),
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

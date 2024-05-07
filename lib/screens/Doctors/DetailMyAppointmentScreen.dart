// import 'package:flutter/material.dart';
// import 'package:hospitalapps/screens/Patients/DetailConsultScreen.dart';

// class DetailMyAppointmentDoctor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Icon(
//                 Icons.person_3_rounded,
//                 size: 50,
//               ),
//               SizedBox(width: 10),
//               ConsultationCard(
//                 patientName: 'Stephanie',
//                 age: '20 years old',
//                 date: 'April 12, 2024',
//                 time: '10:00 AM - 11:00 AM',
//                 status: 'Online Consult',
//               ),
//             ]),
//             Text('Notes'),
//             TextFieldWidget(),
//             JoinMeetBtn(),
//             FinishBtn()
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConsultationCard extends StatelessWidget {
//   final String patientName;
//   final String age;
//   final String date;
//   final String time;
//   final String status;

//   ConsultationCard({
//     required this.patientName,
//     required this.age,
//     required this.date,
//     required this.time,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             width: double.infinity,
//             height: 200,
//           ),
//           Positioned(
//             top: 20,
//             left: 20,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.person_3_rounded,
//                   size: 50,
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       patientName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       age,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Date: $date',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Time: $time',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Status: $status',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TextFieldWidget extends StatefulWidget {
//   @override
//   _TextFieldWidgetState createState() => _TextFieldWidgetState();
// }

// class _TextFieldWidgetState extends State<TextFieldWidget> {
//   TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: TextField(
//         controller: _controller,
//         decoration: InputDecoration(
//           hintText: 'Enter your text here',
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

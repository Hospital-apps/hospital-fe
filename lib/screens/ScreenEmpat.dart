import 'package:flutter/material.dart';

class ScreenEmpat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          Icons.person_3_rounded,
          size: 80,
        ),
        Text("Your Full Name Here"),
        Text("Email : "),
        Text('Phone Number : '),
        Text('Date of Birth : '),
        LogoutButton()
      ]),
    ));
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika logout di sini
        print('Logout button pressed');
      },
      child: Text('Logout'),
    );
  }
}

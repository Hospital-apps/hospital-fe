import 'package:flutter/material.dart';

class AmbulanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hospital Phone Number: 15895916522'),
        ],
      ),
    );
  }
}

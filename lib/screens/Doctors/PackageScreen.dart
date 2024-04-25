import 'package:flutter/material.dart';

class PackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: null,
              child: const Text('Add'),
            ),
            const SizedBox(height: 30),
            Text('Package 1'),
            Text('package 2')
          ],
        ),
      ),
    );
  }
}

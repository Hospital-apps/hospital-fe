import 'package:flutter/material.dart';

class MedicalCheckupScreen extends StatefulWidget {
  const MedicalCheckupScreen({super.key});

  @override
  State<MedicalCheckupScreen> createState() => MedCheckState();
}

class MedCheckState extends State<MedicalCheckupScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medical Checkup'),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('Package 1'),
              ],
            ),
            Image.asset(
              'assets/img/package1.jpg',
              width: 500,
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('Package 2'),
              ],
            ),
            Image.asset(
              'assets/img/package2.jpg',
              width: 500,
              height: 250,
            ),
            NextMedCheckBtn()
          ]),
        ));
  }
}

class NextMedCheckBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika logout di sini
        print('Next Medical Checkup');
      },
      child: Text('Next'),
    );
  }
}

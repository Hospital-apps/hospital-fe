import 'package:flutter/material.dart';

class MedCheck extends StatefulWidget {
  const MedCheck({super.key});

  @override
  State<MedCheck> createState() => MedCheckState();
}

class MedCheckState extends State<MedCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medical Checkup'),
        ),
        body: Center(
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
              'assets/ads1.png',
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
              'assets/ads2.png',
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

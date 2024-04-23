import 'package:flutter/material.dart';

class MedicalCheckupScreen extends StatefulWidget {
  const MedicalCheckupScreen({super.key});

  @override
  State<MedicalCheckupScreen> createState() => MedCheckState();
}

class MedCheckState extends State<MedicalCheckupScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

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
                Text('Date:'),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  ),
                ),
              ],
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
            MakeAppointmentButton(),
          ]),
        ));
  }
}

class MakeAppointmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika membuat janji temu di sini
        print('Appointment created');
      },
      child: Text('Make Appointment'),
    );
  }
}

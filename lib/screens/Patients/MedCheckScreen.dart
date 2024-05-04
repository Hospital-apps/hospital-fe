import 'package:flutter/material.dart';

class MedicalCheckup extends StatefulWidget {
  const MedicalCheckup({Key? key}) : super(key: key);

  @override
  State<MedicalCheckup> createState() => MedCheckState();
}

class MedCheckState extends State<MedicalCheckup> {
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

  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Checkup'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                      if (isChecked1) isChecked2 = false;
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
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                      if (isChecked2) isChecked1 = false;
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
          ],
        ),
      ),
    );
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

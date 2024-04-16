import 'package:flutter/material.dart';

class NextMedCheck extends StatefulWidget {
  const NextMedCheck({Key? key}) : super(key: key);

  @override
  State<NextMedCheck> createState() => NextMedCheckState();
}

class NextMedCheckState extends State<NextMedCheck> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Checkup'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Package'),
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

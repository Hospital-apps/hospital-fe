import 'package:flutter/material.dart';

class AddDoctorInformation extends StatefulWidget {
  const AddDoctorInformation({Key? key}) : super(key: key);

  @override
  State<AddDoctorInformation> createState() => _AddDoctorInfoState();
}

class _AddDoctorInfoState extends State<AddDoctorInformation> {
  String selectedSpecialist = 'Pediatric';
  List<String> selectedTime = ['08.00 - 11.00'];
  List<bool> workDays = List.filled(7, false);

  final List<String> specialistItems = [
    'Pediatric',
    'Dentist',
    'General Practitioner',
    'Orthopedic Surgeon',
    'Dermatologist',
    'Obstetrician',
    'Cardiologist',
    'Gastroenterologists',
    'Psychiatrists',
    'Surgeon'
  ];

  List<String> timeItems = [
    '08.00 - 11.00',
    '13.00 - 16.00',
    '18.00 - 21.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text('Select Specialist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedSpecialist,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSpecialist = newValue!;
                });
              },
              items:
                  specialistItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text('Select Work Days',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 7; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: workDays[i],
                        onChanged: (bool? value) {
                          setState(() {
                            workDays[i] = value!;
                          });
                        },
                      ),
                      Text(_getDayOfWeek(i)),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 10),
            Text('Select Work Time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < timeItems.length; i++)
                  CheckboxListTile(
                    title: Text(timeItems[i]),
                    value: selectedTime.contains(timeItems[i]),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          selectedTime.add(timeItems[i]);
                        } else {
                          selectedTime.remove(timeItems[i]);
                        }
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => print('Add Doctor Information Completed'),
              child: const Text('Save Information'),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayOfWeek(int index) {
    switch (index) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }
}

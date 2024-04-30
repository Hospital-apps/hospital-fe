import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  late DateTime selectedDate;
  String selectedDoctor = 'dr. Jake Sim - Pediatric';
  String selectedType = 'Offline Consultation';
  String selectedTime = '09:00 AM'; // Initial time selection

  final List<String> doctorItems = [
    'dr. Jake Sim - Pediatric',
    'dr. Heeseung Lee - Dentist',
    'dr. Jay Park - General Practitioner',
    'dr. Sunghoon Park - Orthopedic Surgeon',
    'dr. Jungwon Yang - Dermatologist',
    'dr. Sunoo Kim - Obstetrician',
    'dr. Niki - Cardiologist',
  ];

  final List<String> typeItems = [
    'Offline Consultation',
    'Online Consultation',
  ];

  final List<String> timeItems = [
    // Sample time slots
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
  ];

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
      appBar: AppBar(title: const Text('Consultation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select Doctor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedDoctor,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDoctor = newValue!;
                });
              },
              items: doctorItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text('Select Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value:
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              onChanged: (_) => _selectDate(context),
              items: [
                DropdownMenuItem<String>(
                  value:
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                )
              ],
            ),
            SizedBox(height: 20),
            Text('Select Time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue!;
                });
              },
              items: timeItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Select Consultation Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: typeItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => print('Appointment created'),
              child: const Text('Make Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

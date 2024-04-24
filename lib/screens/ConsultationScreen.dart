import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  final TextEditingController _dateController = TextEditingController();
  String _selectedSpecialist = 'Choose';
  String _selectedDoctor = 'Choose';
  String _selectedConsultationType = 'Type';

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Specialist',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedSpecialist,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedSpecialist = newValue!;
                });
              },
              items: <String>[
                'Choose',
                'Cardiologist',
                'Dentist',
                'Pediatrician'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Select Doctor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedDoctor,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedDoctor = newValue!;
                });
              },
              items: <String>[
                'Choose',
                'Dr. Smith',
                'Dr. Johnson',
                'Dr. Williams'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Select Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'YYYY-MM-DD',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  _dateController.text = formattedDate;
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              'Select Consultation Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedConsultationType,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedConsultationType = newValue!;
                });
              },
              items: <String>['Type', 'In-Person', 'Virtual']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedSpecialist != 'Choose' &&
                      _selectedDoctor != 'Choose' &&
                      _selectedConsultationType != 'Type' &&
                      _dateController.text.isNotEmpty) {
                    print('Appointment created with:');
                    print('Specialist: $_selectedSpecialist');
                    print('Doctor: $_selectedDoctor');
                    print('Date: ${_dateController.text}');
                    print('Consultation Type: $_selectedConsultationType');
                  } else {
                    print('Please fill in all fields.');
                  }
                },
                child: const Text('Make Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hospitalapps/controllers/ScheduleController.dart';

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
      appBar: AppBar(
        title: Text('Add Doctor Information'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Select Specialist',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedSpecialist,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSpecialist = newValue!;
                  });
                },
                items: specialistItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Select Work Days',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: List.generate(7, (index) {
                  return FilterChip(
                    label: Text(
                      _getDayOfWeek(index),
                      style: TextStyle(fontSize: 16),
                    ),
                    selected: workDays[index],
                    onSelected: (bool selected) {
                      setState(() {
                        workDays[index] = selected;
                      });
                    },
                    selectedColor: Colors.blue.withOpacity(0.5),
                    checkmarkColor: Colors.white,
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                'Select Work Time',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: List.generate(timeItems.length, (index) {
                  final time = timeItems[index];
                  return FilterChip(
                    label: Text(
                      time,
                      style: TextStyle(fontSize: 16),
                    ),
                    selected: selectedTime.contains(time),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedTime.add(time);
                        } else {
                          selectedTime.remove(time);
                        }
                      });
                    },
                    selectedColor: Colors.blue.withOpacity(0.5),
                    checkmarkColor: Colors.white,
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ScheduleController().saveDoctorInformation(
                      day: _getDayOfWeek(DateTime.now().weekday - 1),
                      timeSlots: selectedTime.map((time) {
                        List<String> parts = time.split(' - ');
                        return {
                          'start': parts[0],
                          'end': parts[1],
                        };
                      }).toList(),
                      specialty: selectedSpecialist,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Doctor information saved successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    print('Add Doctor Information Completed');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to save doctor information: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    print('Failed to save doctor information: $e');
                  }
                },
                child: const Text('Save Information',
                    style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
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

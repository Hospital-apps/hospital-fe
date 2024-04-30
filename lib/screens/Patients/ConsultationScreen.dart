import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => ConsultationState();
}

class ConsultationState extends State<Consultation> {
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
        title: Text('Consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Select Doctor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropDownSelectDoctor(),
            SizedBox(height: 10),
            Text(
              'Select Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
            SizedBox(height: 10),
            Text(
              'Select Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Select Consultation Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropDownSelectType(),
            SizedBox(height: 20),
            MakeAppointmentButton(),
          ],
        ),
      ),
    );
  }
}

class DropDownSelectDoctor extends StatefulWidget {
  @override
  DropDownDoctor createState() => DropDownDoctor();
}

class DropDownDoctor extends State<DropDownSelectDoctor> {
  String _selectedItem = 'Pediatric'; // Initial selected item

  // List of dropdown items
  List<String> _dropdownItems = [
    'dr. Jake Sim - Pediatric',
    'dr. Heeseung Lee - Dentist',
    'dr. Jay Park - General Practitioner',
    'dr. Sunghoon Park - Orthopedic Surgeon',
    'dr. Jungwon Yang - Dermatologist',
    'dr. Sunoo Park - Obstetrician',
    'dr. Niki - Cardiologist',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialist'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedItem,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DropDownSelectType extends StatefulWidget {
  @override
  DropDownType createState() => DropDownType();
}

class DropDownType extends State<DropDownSelectType> {
  String _selectedItem = 'Pediatric'; // Initial selected item

  // List of dropdown items
  List<String> _dropdownItems = [
    'Offline Consultation',
    'Online Consultation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialist'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedItem,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
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
        print('Appointment created');
      },
      child: Text('Make Appointment'),
    );
  }
}

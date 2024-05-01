import 'package:flutter/material.dart';

class AddDoctorInformation extends StatelessWidget {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Select Specialist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropDownSelectSpecialist(),
            SizedBox(height: 10),
            Text(
              'Work Day',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Monday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Tuesday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Wednesday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Thursday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Friday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Saturday'),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Checkbox(
            //       value: isChecked,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text('Sunday'),
            //   ],
            // ),

            SizedBox(height: 10),
            Text(
              'Work Hour',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropDownWorkHourList(),
            UpdateBtn()
          ],
        ),
      ),
    );
  }
}

class DropDownSelectSpecialist extends StatefulWidget {
  @override
  DropDownSpecialist createState() => DropDownSpecialist();
}

class DropDownSpecialist extends State<DropDownSelectSpecialist> {
  String _selectedItem = 'Pediatric'; // Initial selected item

  // List of dropdown items
  List<String> _dropdownItems = [
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

class DropDownWorkHourList extends StatefulWidget {
  @override
  DropDownWorkHour createState() => DropDownWorkHour();
}

class DropDownWorkHour extends State<DropDownWorkHourList> {
  String _selectedItem = '08.00 - 11.00'; // Initial selected item

  // List of dropdown items
  List<String> _dropdownItems = [
    '08.00 - 11.00',
    '13.00 - 16.00',
    '18.00 - 21.00',
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

class UpdateBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Update'),
    );
  }
}

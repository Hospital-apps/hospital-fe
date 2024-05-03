import 'package:flutter/material.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorSchedule> createState() => DoctorScheduleState();
}

class DoctorScheduleState extends State<DoctorSchedule> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Schedule'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Doctor',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // SelectDate(),
          SizedBox(height: 20),
          DoctorList(),
        ],
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('dr. Jake Sim'),
          subtitle: Text('Pediatrician'),
        ),
        ListTile(
          title: Text('dr. Heeseung Lee'),
          subtitle: Text('Cardiologist'),
        ),
        ListTile(
          title: Text('dr. Jay Park'),
          subtitle: Text('Dentist'),
        ),
        ListTile(
          title: Text('dr. Sunghoon Park'),
          subtitle: Text('General Practitioner'),
        ),
        ListTile(
          title: Text('dr. Sunoo Kim'),
          subtitle: Text('Dermatologist'),
        ),
        ListTile(
          title: Text('dr. Jungwon Park'),
          subtitle: Text('Obstetrician'),
        ),
        ListTile(
          title: Text('dr. Niki'),
          subtitle: Text('Surgeon'),
        ),
      ],
    );
  }
}

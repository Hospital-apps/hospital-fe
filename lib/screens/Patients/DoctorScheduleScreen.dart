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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
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
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Jake Sim'),
            Text('Pedatric'),
            Text('Monday, 08.00 - 11.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Heeseung Lee'),
            Text('Cardiologist'),
            Text('Monday, 13.00 - 16.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Jay Park'),
            Text('Dentist'),
            Text('Tuesday, 18.00 - 21.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Sunghoon Park'),
            Text('General Practitioner'),
            Text('Friday, 08.00 - 11.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Sunoo Kim'),
            Text('Dermatologist'),
            Text('Wednesday, 13.00 - 16.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Jungwon Park'),
            Text('Obstetrician'),
            Text('Sunday, 18.00 - 21.00')
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Niki'),
            Text('Surgeon'),
            Text('Thursday, 08.00 - 11.00')
          ],
        ),
      ],
    );
  }
}

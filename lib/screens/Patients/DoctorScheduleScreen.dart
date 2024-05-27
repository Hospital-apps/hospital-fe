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
        backgroundColor: Colors.blue,
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
                  filled: true,
                  fillColor: Colors.grey[200],
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
        _buildDoctorItem('dr. Jake Sim', 'Pedatric', 'Monday, 08.00 - 11.00'),
        _buildDoctorItem(
            'dr. Heeseung Lee', 'Cardiologist', 'Monday, 13.00 - 16.00'),
        _buildDoctorItem('dr. Jay Park', 'Dentist', 'Tuesday, 18.00 - 21.00'),
        _buildDoctorItem('dr. Sunghoon Park', 'General Practitioner',
            'Friday, 08.00 - 11.00'),
        _buildDoctorItem(
            'dr. Sunoo Kim', 'Dermatologist', 'Wednesday, 13.00 - 16.00'),
        _buildDoctorItem(
            'dr. Jungwon Yang', 'Obstetrician', 'Sunday, 18.00 - 21.00'),
        _buildDoctorItem('dr. Niki', 'Surgeon', 'Thursday, 08.00 - 11.00'),
      ],
    );
  }

  Widget _buildDoctorItem(String name, String specialization, String schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          specialization,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
        ),
        Text(
          schedule,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey[400],
          thickness: 1,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

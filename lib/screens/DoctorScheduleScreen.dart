import 'package:flutter/material.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorSchedule> createState() => DoctorScheduleState();
}

class DoctorScheduleState extends State<DoctorSchedule> {
  late DateTime selectedDate;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
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
          SizedBox(height: 20),
          Text('Select Date'),
          SelectDate(),
          SizedBox(height: 20),
          DoctorList(),
        ],
      ),
    );
  }
}

class SelectDate extends StatefulWidget {
  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
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
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          height: 50,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Dr. John Doe'),
          subtitle: Text('Pediatrician'),
        ),
        ListTile(
          title: Text('Dr. Jane Smith'),
          subtitle: Text('Cardiologist'),
        ),
        // Tambahkan daftar dokter lain di sini sesuai kebutuhan
      ],
    );
  }
}

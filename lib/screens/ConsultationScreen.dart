import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => ConsultationState();
}

class ConsultationState extends State<Consultation> {
  // String selectedSpecialist;
  // String selectedDoctor;
  // DateTime selectedDate = DateTime.now();
  // String selectedConsultationType;

  // List<String> specialists = [
  //   'Pediatric',
  //   'Dentist',
  //   'Orthopedic',
  //   'Radiologist',
  //   'Nutritionist'
  // ];
  // List<String> doctors = [
  //   'dr, Jake Sim',
  //   'dr. Heeseung Lee',
  //   'dr. Jay Park',
  //   'dr. Sunoo Kim',
  //   'dr. Sunghoon Park',
  //   'dr. Nishimura Riki'
  // ];
  // List<String> consultationTypes = ['Online', 'Offline'];

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

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
            SizedBox(height: 20),
            Text(
              'Select Specialist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // DropdownButtonFormField<String>(
            //   value: selectedSpecialist,
            //   onChanged: (newValue) {
            //     setState(() {
            //       selectedSpecialist = newValue!;
            //     });
            //   },
            //   items: specialists.map((specialist) {
            //     return DropdownMenuItem(
            //       child: Text(specialist),
            //       value: specialist,
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(
            //     labelText: 'Select Specialist',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              'Select Doctor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // DropdownButtonFormField<String>(
            //   value: selectedDoctor,
            //   onChanged: (newValue) {
            //     setState(() {
            //       selectedDoctor = newValue!;
            //     });
            //   },
            //   items: doctors.map((doctor) {
            //     return DropdownMenuItem(
            //       child: Text(doctor),
            //       value: doctor,
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(
            //     labelText: 'Select Doctor',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              'Select Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DatePickerExample(),
            // Row(
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () => _selectDate(context),
            //         child: InputDecorator(
            //           decoration: InputDecoration(
            //             labelText: 'Select Date',
            //             border: OutlineInputBorder(),
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 "${selectedDate.toLocal()}".split(' ')[0],
            //               ),
            //               Icon(Icons.calendar_today),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 10),
            Text(
              'Select Consultation Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // DropdownButtonFormField<String>(
            //   value: selectedConsultationType,
            //   onChanged: (newValue) {
            //     setState(() {
            //       selectedConsultationType = newValue!;
            //     });
            //   },
            //   items: consultationTypes.map((type) {
            //     return DropdownMenuItem(
            //       child: Text(type),
            //       value: type,
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(
            //     labelText: 'Select Consultation Type',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 20),
            MakeAppointmentButton(),
          ],
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

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }
}

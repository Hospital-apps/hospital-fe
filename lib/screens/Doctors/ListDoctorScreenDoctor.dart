import 'package:flutter/material.dart';

class ListDoctorScreenDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: null,
              child: const Text('Add'),
            ),
            const SizedBox(height: 30),
            DoctorList()
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

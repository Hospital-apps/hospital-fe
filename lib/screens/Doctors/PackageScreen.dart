import 'package:flutter/material.dart';
import 'package:hospitalapps/screens/Doctors/AddPackageScreen.dart';

class PackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: 20,
          left: 20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AddPackageBtn(),
            Text(
              'Package 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/img/package1.jpg',
              width: 500,
              height: 250,
            ),
            Text(
              'Package 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Image.asset(
              'assets/img/package2.jpg',
              width: 500,
              height: 250,
            ),
          ]),
        ),
      ]),
    );
  }
}

class AddPackageBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPackage()),
        );
      },
      child: Text('Add'),
    );
  }
}

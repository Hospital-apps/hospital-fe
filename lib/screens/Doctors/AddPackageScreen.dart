import 'package:flutter/material.dart';

class AddPackage extends StatelessWidget {
  const AddPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Package Name'),
            Text('Image/Detail Package'),
            AddPackageBtn()
          ],
        ),
      ),
    );
  }
}

class AddPackageBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Add Package'),
    );
  }
}

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
            TextFieldWidget(),
            AddPackageBtn()
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter your text here',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

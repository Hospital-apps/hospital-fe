import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceScreen extends StatelessWidget {
  final String phoneNumber = '+15895916522';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Ambulance"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'In case of emergency, please contact us immediately via WhatsApp:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(Icons.chat),
                label: Text('Contact via WhatsApp'),
                onPressed: () => _launchWhatsApp(phoneNumber),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green, // foreground (text/icon) color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp(String number) async {
    var whatsappUrl =
        "https://wa.me/$number?text=${Uri.encodeComponent('Hello, I need help!')}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      Get.snackbar(
        'Error', // Title
        'Could not launch WhatsApp. Please try again later.', // Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        margin: EdgeInsets.all(10),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }
}

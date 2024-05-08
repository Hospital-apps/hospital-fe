import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart'; // Import GetX library

class JoinMeetBtn extends StatelessWidget {
  final String? meetLink;

  JoinMeetBtn({this.meetLink});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handlePress(context), // Updated to call _handlePress
      child: Text('Join Meet'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handlePress(BuildContext context) {
    if (meetLink == null) {
      // Using GetX to show a Snackbar when the meet link is not available
      Get.snackbar(
        'No Meeting Link', // Title of the Snackbar
        'Sorry, the Zoom meeting link is not available.', // Message of the Snackbar
        snackPosition: SnackPosition.BOTTOM, // Position of the Snackbar
        backgroundColor: Colors.red, // Background color of the Snackbar
        colorText: Colors.white, // Text color
        borderRadius: 20, // Border radius of the Snackbar
        margin: EdgeInsets.all(10), // Margin around the Snackbar
        duration: Duration(seconds: 3), // Duration the Snackbar is shown
      );
    } else {
      _launchURL(meetLink!);
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Snackbar for error handling if the URL cannot be launched
      Get.snackbar(
        'Error',
        'Could not launch the meeting link.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 20,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
      );
    }
  }
}

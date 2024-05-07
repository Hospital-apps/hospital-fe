import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceMenuController {
  void handleAmbulanceMenuClicked(BuildContext context) async {
    const phoneNumber =
        '15895916522'; // Ganti dengan nomor telepon ambulan yang sesuai

    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

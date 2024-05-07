import 'package:flutter/services.dart';

class AmbulanceService {
  static const MethodChannel _channel = MethodChannel('ambulance_channel');

  static Future<void> callAmbulance() async {
    try {
      await _channel.invokeMethod('callAmbulance');
    } on PlatformException catch (e) {
      print("Failed to call ambulance: '${e.message}'.");
    }
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await _prefs?.setString('token', token);
  }

  static String? getToken() {
    return _prefs?.getString('token');
  }

  static Future<void> removeToken() async {
    await _prefs?.remove('token');
  }

  static String? decodeToken(String token) {
    List<String> parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    String payload = parts[1];
    String normalizedPayload = base64Url.normalize(payload);
    Map<String, dynamic> decoded =
        json.decode(utf8.decode(base64Url.decode(normalizedPayload)));
    return decoded['_id'];
  }
}

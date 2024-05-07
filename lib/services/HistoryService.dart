// services/history_service.dart
import 'package:dio/dio.dart';
import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:hospitalapps/models/history.dart';

class HistoryService {
  final Dio _dio = Dio();

  Future<List<History>> fetchHistory() async {
    try {
      await TokenManager.init();

      String? token = TokenManager.getToken();

      _dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await _dio.get('http://10.0.2.2:3000/api/history/info');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => History.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}

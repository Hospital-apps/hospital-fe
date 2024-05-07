// controllers/history_controller.dart
import 'package:get/get.dart';
import 'package:hospitalapps/models/history.dart';
import 'package:hospitalapps/services/HistoryService.dart';

class HistoryController extends GetxController {
  var isLoading = true.obs;
  var historyList = <History>[].obs;

  final HistoryService _historyService = HistoryService();

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  void fetchHistory() async {
    try {
      isLoading(true);
      List<History> histories = await _historyService.fetchHistory();
      historyList.assignAll(histories);
    } finally {
      isLoading(false);
    }
  }
}

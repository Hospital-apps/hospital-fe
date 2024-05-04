import 'package:get/get.dart';
import 'package:hospitalapps/services/ProfileService.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();
  final RxMap userProfile = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() async {
    var profileData = await _profileService.fetchProfile();
    if (profileData != null) {
      userProfile.assignAll(profileData['data']);
    }
  }
}

import 'package:hospitalapps/controllers/tokenController.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthUtils {
  static String? getPatientId() {
    String? token = TokenManager.getToken();
    if (token != null && Jwt.isExpired(token) == false) {
      Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
      return decodedToken['_id'];
    }
    return null;
  }
}

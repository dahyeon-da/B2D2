import 'package:frontend_project/src/connect/user_connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class UserController extends GetxController {
  final userConnection = Get.put(UserConnect());

  // 로그인을 시도하는 함수
  Future login(String memberId, String memberPassword) async {
    try {
      String token = await userConnection.sendLogin(memberId, memberPassword);
      await _storage.write('access_token', token);
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}

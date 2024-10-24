import 'package:frontend_project/src/connect/user_connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class UserController extends GetxController {
  final userConnection = Get.put(UserConnect());

  // 로그인 or 회원가입 여부를 확인
  Future<bool> isLogin() async {
    return await _storage.hasData('access_token');
  }

  // 로그인을 시도하는 함수
  Future login(String memberId, String memberPassword) async {
    try {
      Map<String, dynamic> result =
          await userConnection.sendLogin(memberId, memberPassword);
      await GetStorage.init();
      await _storage.write('access_token', result['access_token']);
      return result;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

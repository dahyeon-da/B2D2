import 'package:frontend_project/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

// 회원 관련 통신 담당 클래스
class UserConnect extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future sendLogin(String memberId, String memberPassword) async {
    Response response = await post('/api/v2/auth/signin',
        {'memberId': memberId, 'memberPassword': memberPassword});
    Map<String, dynamic> body = response.body;
    print(body);

    if (body['code'] != 200) {
      throw Exception(body['code']);
    }
    String? accessToken = response.headers?['refreshtoken'];
    print(accessToken);
    await _storage.write('access_token', accessToken);
    print(_storage.read('access_token'));
    return body['data'];
  }
}

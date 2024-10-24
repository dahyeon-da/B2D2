import 'package:frontend_project/shared/global.dart';
import 'package:get/get.dart';

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
    Response response = await post('/api/user/login',
        {'memberId': memberId, 'memberPassword': memberPassword});
    Map<String, dynamic> body = response.body;

    if (body['code'] != 201) {
      throw Exception(body['code']);
    }
    return body['data'];
  }
}

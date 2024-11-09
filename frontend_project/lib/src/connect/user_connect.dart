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

  // 토큰 받아오기
  get getToken async {
    String token = _storage.read("access_token");
    return ('Baearer $token');
  }

  Future sendLogin(String memberId, String memberPassword) async {
    try {
      Response response = await post('/api/v2/auth/signin',
          {'memberId': memberId, 'memberPassword': memberPassword});
      Map<String, dynamic> body = response.body;
      print(body);

      if (body['code'] != 200) {
        return null;
      }

      String? accessToken = response.headers?['accesstoken'];
      await _storage.write('access_token', accessToken);
      return body['data'];
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future sendRegister(String memberId, String memberPassword, String memberName,
      String memberPhoneNumber, String memberGroup) async {
    try {
      Response response = await post('/api/v2/auth/signup', {
        'memberId': memberId,
        'memberPassword': memberPassword,
        'memberName': memberName,
        'memberPhoneNumber': memberPhoneNumber,
        'memberGroup': memberGroup
      });
      Map<String, dynamic> body = response.body;

      if (body['code'] != 201) {
        return null;
      }
      String? accessToken = response.headers?['accesstoken'];
      await _storage.write('access_token', accessToken);
      return body;
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }

  Future sendUpdateUser(
      String memberName, String memberPassword, String memberGroup) async {
    try {
      Response response = await patch('/api/v2/users/mine', {
        'memberName': memberName,
        'memberPassword': memberPassword,
        'memberGroup': memberGroup
      }, headers: {
        'authorization': await getToken
      });

      Map<String, dynamic> body = response.body;

      print(body);

      if (body['code'] != 200) {
        print('Connect Error');
        return null;
      }
      return body;
    } catch (e) {
      return null;
    }
  }

  // Future renewalToken(String oldToken) async {
  //   try {
  //     Response response = await post('api/v2/auth/token', headers: )
  //   } catch(e) {

  //   }
  // }
}

import 'package:frontend_project/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class ImageConnect extends GetConnect {
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
    return _storage.read("access_token");
  }

  // 이미지 업로드
  // Future ImageUpload(int feedNum) async {
  //   try {
  //     Response response = await post(
  //       '/api/v2/feeds/${feedNum}/images',

  //     );
  //     Map<String, dynamic> body = response.body;

  //     if (body['code'] != 201) {
  //       throw Exception(body['message']);
  //     }
  //     return body['data'];
  //   } catch (e) {
  //     print('Error : $e');
  //   }
  // }
}

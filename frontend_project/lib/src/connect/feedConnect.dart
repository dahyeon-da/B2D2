import 'package:frontend_project/shared/global.dart';
import 'package:get/get_connect/connect.dart';

class FeedConnect extends GetConnect {
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

  // 피드 전체 리스트 불러오기
  Future FeedList() async {
    try {
      Response response = await get('/api/feed/list');
      Map<String, dynamic> body = response.body;

      if (body['code'] != 201) {
        throw Exception(body['message']);
      }
      return body['data'];
    } catch (e) {
      print('Error : $e');
    }
  }
}

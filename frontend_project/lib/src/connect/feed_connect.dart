import 'package:frontend_project/shared/global.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

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

  // 토큰 받아오기
  get getToken async {
    return _storage.read("access_token");
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

  // 피드 등록하기
  Future sendFeedWrite(String memberName, String memberGroup, String boardDate,
      String boardContent) async {
    print(await getToken);
    Response response = await post('/api/v2/feeds', {
      'memberName': memberName,
      'memberGroup': memberGroup,
      'boardDate': boardDate,
      'boardContent': boardContent
    }, headers: {
      'authorization': await getToken
    });
    
    Map<String, dynamic> body = response.body;
    print(body);

    if (body['code'] != 201) {
      throw Exception(body['code']);
    }
    return body['data'];
  }
}

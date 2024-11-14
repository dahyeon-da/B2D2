import 'package:frontend_project/shared/global.dart';
import 'package:frontend_project/src/connect/user_connect.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class FeedConnect extends GetConnect {
  final userConnect = Get.put(UserConnect());

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

  // 피드 전체 리스트 불러오기
  Future FeedList([group_num = 0]) async {
    try {
      String url = '/api/v2/feeds';
      if (0 < group_num) {
        url += '?group_num=$group_num';
      }
      Response response = await get(url);
      Map<String, dynamic> body = response.body;

      if (body['code'] != 200) {
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
    } else if (body['code'] == 401) {}
    return body['data'];
  }

  // 자신이 작성한 피드 불러오기
  Future sendFeedsMine() async {
    try {
      Response response = await get('/api/v2/users/mine/feeds',
          headers: {'authorization': await getToken});

      Map<String, dynamic> body = response.body;
      print(body);

      if (body['code'] != 200) {
        return null;
      }
      return body['data'];
    } catch (e) {
      print('Error $e');
      return null;
    }
  }

  // 피드 삭제하기
  sendFeedDelete(int feedNum) async {
    try {
      Response response = await delete('/api/v2/feeds/${feedNum}',
          headers: {'authorization': await getToken});

      Map<String, dynamic> body = response.body;
      print(body);

      if (body['code'] != 200) {
        return null;
      }
      return body;
    } catch (e) {
      return null;
    }
  }

  // 피드 수정하기
  Future sendFeedUpdate(
      int feedNum, String boardDate, String boardContent) async {
    try {
      Response response = await patch('/api/v2/feeds/${feedNum}',
          {'boardDate': boardDate, 'boardContent': boardContent},
          headers: {'authorization': await getToken});

      Map<String, dynamic> body = response.body;
      print(body);

      if (body['code'] != 200) {
        return null;
      } else if (body['code'] == 401) {
        userConnect.renewalToken(await getToken);
      }
      return body;
    } catch (e) {
      return null;
    }
  }

  // 이미지 삭제하기
  sendImageDelete(int fileNum) async {
    try {
      Response response = await delete('/api/v2/images/${fileNum}',
          headers: {'authorization': await getToken});

      Map<String, dynamic> body = response.body;
      print(body);

      if (body['code'] != 200) {
        return null;
      }
      return body;
    } catch (e) {
      return null;
    }
  }
}

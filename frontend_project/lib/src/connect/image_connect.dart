import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend_project/shared/global.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class ImageConnect {
  // 토큰 받아오기
  get getToken async {
    return _storage.read("access_token");
  }

  final Dio _dio = Dio();
  Dio dio = Dio(BaseOptions(
    baseUrl: Global.apiRoot,
  ));

  Future uploadImage(int feedNum, List<File> imageFiles) async {
    try {
      List<MultipartFile> images = [];
      for (var imageFile in imageFiles) {
        images.add(await MultipartFile.fromFile(imageFile.path));
      }

      FormData formData = FormData.fromMap({
        'files': images,
      });

      Response response = await dio.post(
        '/api/v2/feeds/${feedNum}/images',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken}',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      Map<String, dynamic> body = response.data;

      print(body);

      if (body['code'] != 201) {
        return null;
      }
      return body;
    } catch (e) {
      throw Exception('서버 통신오류: $e');
    }
  }

  // 이미지 업로드
  // Future ImageUpload(int feedNum, List<File> images) async {
  //   try {
  //     Response response = await post('/api/v2/feeds/${feedNum}/images', {
  //       'files': images,
  //     });
  //     Map<String, dynamic> body = response.body;
  //     print(body);

  //     if (body['code'] != 201) {
  //       throw Exception(body['message']);
  //     }
  //     return body['data'];
  //   } catch (e) {
  //     print('Error : $e');
  //   }
  // }
}

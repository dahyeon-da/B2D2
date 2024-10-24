import 'package:flutter/material.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedPage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 테마 설정
      theme: ThemeData(
        // Google Fonts 적용
        fontFamily: GoogleFonts.nanumGothic().fontFamily,
      ),
      // 디버그 모드 배너 숨기기
      debugShowCheckedModeBanner: false,
      // 시작 페이지 설정
      home: Feedpage(),
    );
  }
}

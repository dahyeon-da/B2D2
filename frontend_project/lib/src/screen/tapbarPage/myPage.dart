import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/screen/introduce/b2d2Introduce.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Image.asset('assets/logo.png', height: 23.h),
          SizedBox(width: 10.w),
        ],
        backgroundColor: Color.fromRGBO(245, 208, 67, 1),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.3))),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '시흥시청소년재단 소개',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.3))),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '시화호청소년환경감시단 소개',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.3))),
            child: TextButton(
              onPressed: () {
                // 다음을 클릭하면 동아리 선택창으로 이동
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => B2d2Introduce()));
                });
              },
              child: Text(
                '디지털환경감시단(B2D2) 소개',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.3))),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '내 정보 수정',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.3))),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '로그아웃',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

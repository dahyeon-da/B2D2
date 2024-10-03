import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/screen/auth/login.dart';
import 'package:frontend_project/src/screen/auth/register.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.h),
          Image.asset(
            'assets/clickMyPage.png',
            height: 330.h,
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            width: double.infinity,
            height: 45.h,
            child: OutlinedButton(
              onPressed: () {
                // 로그인을 클릭하면 로그인 창으로 이동
                Future.delayed(Duration.zero, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 136, 84, 1),
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color.fromRGBO(245, 208, 67, 1),
                side: BorderSide(
                  width: 0.2,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45.h,
            margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            child: OutlinedButton(
              onPressed: () {
                // 회원가입을 클릭하면 회원가입 창으로 이동
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                });
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 136, 84, 1),
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  width: 0.2,
                ),
              ),
            ),
          ),
          SizedBox(height: 100.h),
          Image.asset(
            'assets/logo.png',
            height: 33.h,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class B2d2Introduce extends StatelessWidget {
  const B2d2Introduce({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 208, 67, 1),
        title: Text(
          'B2D2 소개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          height: 300.h,
          width: double.infinity,
          color: Color.fromRGBO(245, 208, 67, 1),
        ),
        Container(
          height: 480.h,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(30.w, 110.h, 30.w, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(97, 136, 84, 1),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20.w, top: 30.h),
                child: Text(
                  'B2D2',
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  '[B]aegot',
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  '[2]',
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  '[D]igital',
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  '[2]together',
                  style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      'Da_hyeon',
                      style: GoogleFonts.dosis(
                        textStyle: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/instagram.png',
                      height: 40.h,
                    ),
                    hoverColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      'Min_seung',
                      style: GoogleFonts.dosis(
                        textStyle: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/instagram.png',
                      height: 40.h,
                    ),
                    hoverColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

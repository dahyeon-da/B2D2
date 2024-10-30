import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:frontend_project/src/widget/circle_image.dart';

class Environmentalmonitoringintroduce extends StatelessWidget {
  const Environmentalmonitoringintroduce({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(),
      body: ListView(
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            color: Color.fromRGBO(245, 208, 67, 1),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/sihwaho.png',
                      height: 80.h,
                    ),
                    SizedBox(width: 10.h)
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/sihwaho_children.jpg',
                        height: 180.h,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Image.asset(
            'assets/phrase.png',
            height: 55.h,
          ),
          SizedBox(height: 20.h),
          Container(
            height: 360.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Color.fromRGBO(97, 136, 84, 1),
                      ),
                      height: 300.h,
                      width: 300.h,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(120)),
                      height: 240.h,
                      width: 240.h,
                    )
                  ],
                ),
                Positioned(
                  top: 0.h,
                  child: Column(
                    children: [
                      CircleImage(imageName: 'B2D2.png'),
                      Text('B2D2',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Positioned(
                  right: 25.h,
                  top: 75.h,
                  child: Column(
                    children: [
                      CircleImage(imageName: 'greenwhale.jpg'),
                      const Text('그린웨일',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Positioned(
                  left: 25.h,
                  top: 75.h,
                  child: Column(
                    children: [
                      CircleImage(imageName: 'darly.jpg'),
                      Text('달리',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Positioned(
                  right: 70.h,
                  bottom: 15.h,
                  child: Column(
                    children: [
                      CircleImage(imageName: 'guard.jpg'),
                      Text('지킴이',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Positioned(
                  left: 70.h,
                  bottom: 15.h,
                  child: Column(
                    children: [
                      CircleImage(imageName: 'BSAS.jpg'),
                      Text('B.S.A.S',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

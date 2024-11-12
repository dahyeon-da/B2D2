import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/widget/app_bar.dart';

class Siheungintroduce extends StatelessWidget {
  const Siheungintroduce({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      appBar: App_bar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            color: Color.fromRGBO(245, 208, 67, 1),
            child: Image.asset('assets/siheung.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
            child: Image.asset(
              'assets/youth_foundation.png',
              height: 50.h,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Text(
              '청소년을 존중하는 시흥시!\n시흥시청소년재단 홈페이지를 방문해 주신 청소년과 시민여러분, 진심으로 환영합니다.\n시흥시청소년재단은 2020년 9월 8일, 시흥시청소년의 건강하고 행복한 성장에 기여함을 목적으로 설립되었습니다.\n현재, 청소년의 꿈을 펼치고 도전하며 안전한 성장을 지원하는 다수의 청소년활동 및 상담복지시설이 시흥시 전 지역에 건립되고 있습니다.\n이는, 시흥시 전체가 다양한 청소년특화 컨텐츠를 담은 청소년 활동공간이 되고, 촘촘한 사회적 안전망구축에 의한 청소년상담과 위기청소년지원이 더욱 강화됨을 의미합니다.\n시흥시 청소년의 이야기에 귀 기울이고, 청소년이 그리는 소중한 꿈을 위한 정책을 여러분과 함께 개발하고 적극 지원하겠습니다. 열정과 도전 속에 지역과 사람, 그리고 스스로를 존중하고 배려하는 시흥시 청소년상을 함께 만들어 가고자 하오니,시흥시청소년과 시민모두의 따뜻한 응원과 참여를 부탁드립니다.\n시흥시 청소년은 행복할 권리가 있으며, 이를 위해 재단 임직원 모두가 시흥시 청소년을 존중하겠습니다.\n재단법인 시흥시청소년재단\n대표이사 이덕희',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

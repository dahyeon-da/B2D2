import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/model/groupModel.dart';
import 'package:frontend_project/src/widget/app_bar.dart';

class Groupintroduce extends StatefulWidget {
  final int group;

  const Groupintroduce({super.key, required this.group});

  @override
  State<Groupintroduce> createState() => _GroupintroduceState();
}

class _GroupintroduceState extends State<Groupintroduce> {
  List<Groupmodel> groupList = [
    Groupmodel(
        'B2D2',
        'B2D2.png',
        '‘B2D2’는\n시화호청소년환경감시단의\n여러활동을 디지털화하려\n데이터를 축적하기 위해\n환경감시다 전용 어플을 개발하는\n청소년 디지털환경감시단입니다.',
        'baegot2.PNG'),
    Groupmodel(
        '그린웨일',
        'greenwhale.jpg',
        '‘그린웨일’은 \n국제어항이 된 월곶포구를 중심으로\n 해양쓰레기 유입경로와 종류를 모니터링하고 \n포구 주변을 정화하며 \n해양생태를 지키고 \n환경캠페인 기획을 통해 \n해양생태의 중요성과 보전의식을\n전파하는 활동을 하고 있습니다. ',
        'wolgot.PNG'),
    Groupmodel(
        '달리',
        'darly.jpg',
        '‘환경을 위해 달린다’라는 \n뜻을 갖고 있는 환경감시단 달리는 \n22년부터 활동 중인 \n꾸미청소년문화의집\n 환경감시동아리 입니다. \n우리 동네의 \n옥구천 수질을 감시하고\n 다양한 환경캠페인 활동을 \n운영하고 있습니다 !',
        'Kkoomi.PNG'),
    Groupmodel(
        '지킴이',
        'guard.jpg',
        '‘지킴이’는 배곧천을 중심으로 \n식생과 수질 현황을 \n정기적으로 모니터링하고 \n지속적인 지역환경 보호활동을 위해 \n다양한 환경보호 캠페인을 \n기획하고 운영하는 \n청소년 환경감시단입니다!',
        'baegot1.PNG'),
    Groupmodel(
        'BSAS',
        'BSAS.jpg',
        '‘B.S.A.S’는\n생태환경이 복원된 \n시화호의 조류를 모니터링하며 새들과의\n 공존을 도모하는\n 조류모니터링단 입니다.',
        'jeongwang.PNG')
  ];

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
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
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/${groupList[widget.group].imageName}',
                        height: 180.h,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
            child: Image.asset(
                'assets/${groupList[widget.group].institutionName}'),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 15.h),
              child: Text(
                '${groupList[widget.group].groupName}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              )),
          Container(
              width: double.infinity,
              child: Text(
                '${groupList[widget.group].content}',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/widget/app_bar.dart';

class Personalinformation extends StatefulWidget {
  const Personalinformation({super.key});

  @override
  State<Personalinformation> createState() => _PersonalinformationState();
}

class _PersonalinformationState extends State<Personalinformation> {
  bool isChecked = false;
  bool notYet = false;

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
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
            child: Text(
              '회원이용약관\n\n제1장 총칙\n\n제1조 (목적)\n\n이 약관은 시흥시청소년재단(소속시설 포함) (이하 "시흥시청소년재단(소속시설 포함)" 이라 합니다) 홈페이지가 제공하는 통합회원 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와 시흥시청소년재단(소속시설 포함)간의 권리·의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.\n\n\n제2조 (약관의 효력 및 변경)\n\n① 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 공지함으로써 이용자에게 공시하고, 이에 동의한 이용자가 서비스에 가입함으로써 효력이 발생합니다.\n\n② 시흥시청소년재단(소속시설 포함)은 필요하다고 인정되는 경우 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 서비스 화면에 공지함으로써 이용자가 직접 확인할 수 있도록 할 것입니다.\n\n③ 이용자는 변경된 약관에 동의하지 않으실 경우 서비스 이용을 중단하고 본인의 회원등록을 취소할 수 있으며, 계속 사용하시는 경우에는 약관 변경에 동의한 것으로 간주되며 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.\n\n④ 이용자가 이 약관의 내용에 동의하는 경우 시흥시청소년재단(소속시설 포함)의 서비스 제공행위 및 이용자의 서비스 이용행위에는 이 약관이 우선적으로 적용될 것입니다. 이 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신망이용촉진및정보보호등에관한법률, 방송통신심의위원회 심의규정, 정보통신 윤리강령, 프로그램 보호법 등 기타 대한민국의 관련법령과 상관습에 의합니다.\n\n\n제3조 (용어의 정의)\n\n① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n\n1. 이용자 : 서비스에 접속하여 시흥시청소년재단(소속시설 포함)이 제공하는 서비스를 받는 회원 및 비회원\n\n2. 회원 : 서비스에 접속하여 이 약관에 동의하고, ID(고유번호)와 PASSWORD(비밀번호)를 발급 받아 문자 인증 등 확인 절차를 거친 자\n\n3. 비회원 : 회원가입을 하지 않고 시흥시청소년재단(소속시설 포함)이 제공하는 서비스를 이용하는 자\n\n4. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 시흥시청소년재단(소속시설 포함)이 승인하는 영문자와 숫자의 조합\n\n5. PASSWORD(비밀번호) : 회원의 정보 보호를 위해 이용자 자신이 설정한 문자와 숫자의 조합\n\n6. 이용해지 : 시흥시청소년재단(소속시설 포함) 또는 회원이 서비스 이용 이후 그 이용계약을 종료시키는 의사표시\n\n② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 안내에서 정하는 바에 의합니다.\n\n제2장 서비스 이용계약\n\n제4조 (이용계약의 성립)\n\n이용계약은 이용자의 약관내용에 대한 동의와 이용자의 이용신청에 대한 시흥시청소년재단(소속시설 포함)의 승낙으로 성립합니다.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Checkbox(
                  splashRadius: 0,
                  value: isChecked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  activeColor: Colors.grey,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      notYet = value!;
                    });
                  }),
              Text('이용약관에 확인합니다.')
            ],
          ),
          notYet
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
                  child: Text(
                    '이용약관에 확인해주십시오.',
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ),
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 212, 58, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () => {isChecked ? Navigator.of(context).pop() : null},
              child: Text(
                '다음',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/model/groupModel.dart';
import 'package:frontend_project/src/widget/group_select_radio_item.dart';
import 'package:frontend_project/src/widget/tap_bar.dart';

class GroupSelect extends StatefulWidget {
  const GroupSelect({super.key});

  @override
  State<GroupSelect> createState() => _GroupSelectState();
}

class _GroupSelectState extends State<GroupSelect> {
  // 그룹 리스트와 선택 상태
  List<StyleRadioModel> _groupList = [
    StyleRadioModel(true, '메카트로닉스', 'group1'),
    StyleRadioModel(false, '씨밀레', 'group2'),
    StyleRadioModel(false, 'B2D2', 'group3'),
    StyleRadioModel(false, '지킴이', 'group4'),
    StyleRadioModel(false, '일반회원', 'group5')
  ];
  String _selectedGroup = '메카트로닉스';
  String _selectedGroupCode = '';

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('동아리 선택'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 120.h),
          Column(
            children: _groupList.map((item) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // 선택된 항목만 isSelected 상태 true로 변경
                    _groupList.forEach((element) {
                      element.isSelected = false;
                    });
                    item.isSelected = true;
                    _selectedGroup = item.groupName;
                    _selectedGroupCode = item.groupCode;
                  });
                },
                child: Groupselectradioitem(item),
              );
            }).toList(),
          ),
          Container(
            width: double.infinity,
            height: 40.h,
            margin: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 160.h),
            child: OutlinedButton(
              onPressed: () {
                // 선택완료를 클릭하면 탭바 중 메인화면창으로 이동
                Future.delayed(Duration.zero, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Tapbar()));
                });
              },
              child: Text(
                '선택완료',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(245, 208, 67, 1),
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(width: 0.2),
                backgroundColor: Color.fromRGBO(97, 136, 84, 1),
              ),
            ),
          ),
          Image.asset(
            'assets/logo.png',
            height: 33.h,
          )
        ],
      ),
    );
  }
}

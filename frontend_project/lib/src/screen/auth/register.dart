import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/controller/user_controller.dart';
import 'package:frontend_project/src/model/feedModel.dart';
import 'package:frontend_project/src/screen/feed/personalInformation.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedWritePage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userController = Get.put(UserController());

  // 로그인 시 필요한 formkey, 텍스트 입력시 입력한 아이디, 비밀번호 파악을 위한 controller 변수 생성
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  String registerFail = '';

  List<String> _groupList = ['B2D2', '지킴이', '달리', 'B.S.A.S', '그린웨일'];
  var _selectedGroup = 'B2D2';
  bool isChecked = false;

  _submitForm() async {
    final String memberId = _idController.text;
    final String memberPassword = _passwordController.text;
    final String memberName = _nameController.text;
    final String memberPhoneNumber = _phoneNumberController.text;

    print(memberId +
        memberPassword +
        memberName +
        memberPhoneNumber +
        _selectedGroup);

    Map<String, dynamic> results = await userController.register(memberId,
        memberPassword, memberName, memberPhoneNumber, _selectedGroup);
    Feedmodel userInformation = Feedmodel(memberName, _selectedGroup);

    if (results != null && results.isNotEmpty && isChecked) {
      // 회원가입 성공 시 피드 작성 페이지로 이동
      Get.to(Feedwritepage(userInformation: userInformation));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('회원가입'),
        backgroundColor: Colors.white,
      ),
      body: Form(
        child: ListView(
          children: [
            SizedBox(height: 80.h),
            // 아이디 입력창
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: '아이디',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // 비밀번호 입력창
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // 비밀번호확인 입력창
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
              child: TextFormField(
                controller: _passwordCheckController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호 확인',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // 이름 입력창
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: '이름',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // 전화번호 입력창
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
              child: TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  labelText: '전화번호',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.7, color: Colors.grey))),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 0),
              child: Text(
                '동아리',
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            // 동아리 선택
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
              child: DropdownButton(
                  itemHeight: 48.0,
                  underline: SizedBox.shrink(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  alignment: Alignment.centerLeft,
                  focusColor: Colors.white,
                  dropdownColor: Colors.white,
                  value: _selectedGroup,
                  items: _groupList.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGroup = value!;
                    });
                  }),
            ),
            Row(
              children: [
                SizedBox(width: 20.w),
                Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 0.h,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Personalinformation()));
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text(
                  '이용 약관 및 개인정보 처리 방침에 동의합니다.',
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
            // 다음으로 가는 버튼
            Container(
              padding: EdgeInsets.only(left: 280.w),
              margin: EdgeInsets.fromLTRB(0, 10.w, 20.w, 0),
              height: 40.h,
              child: OutlinedButton(
                onPressed: _submitForm,
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 212, 58, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(width: 0.2),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Image.asset(
              'assets/logo.png',
              height: 33.h,
            )
          ],
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
  }
}

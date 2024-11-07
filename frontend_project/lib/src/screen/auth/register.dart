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

  // 비밀번호가 형식에 맞는지 파악하기 위한 변수
  final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_\-+=\[\]{}|:;,.<>?/`~]).{8,}$');

  // 회원가입 시 에러처리 텍스트 생성
  String errorText = '';

  String registerFail = '';

  List<String> _groupList = ['B2D2', '지킴이', '달리', 'B.S.A.S', '그린웨일'];
  var _selectedGroup = 'B2D2';
  bool isChecked = false;

  _submitForm() async {
    try {
      final memberId = _idController.text;
      final memberPassword = _passwordController.text;
      final memberName = _nameController.text;
      final memberPhoneNumber = _phoneNumberController.text;
      final memberPasswordCheck = _passwordCheckController.text;

      print(
          '$memberId $memberPassword $memberName $memberPhoneNumber $_selectedGroup');

      String? error;
      if (memberPassword != memberPasswordCheck) {
        error = '비밀번호가 같지 않습니다.';
      } else if (!isChecked) {
        error = '이용 약관을 확인해주세요.';
      } else if (!passwordRegex.hasMatch(memberPassword)) {
        error =
            '비밀번호는 영문, 숫자, 특수문자(!, @, #, \$, %, ^, &, *, (, ), _, +, -, =, {, }, \[, \], |, :, ;, \", \', <, >, ,, ., ?, /, ~, \`)를 포함한 8자 이상의 문자여야 합니다.';
      }

      if (error != null) {
        setState(() => errorText = error!);
        return;
      }

      final results = await userController.register(
        memberId,
        memberPassword,
        memberName,
        memberPhoneNumber,
        _selectedGroup,
      );

      if (results == null || results.isEmpty) {
        setState(() => errorText = '회원가입에 실패했습니다.');
        return;
      }

      final userInformation = Feedmodel(memberName, _selectedGroup);
      Get.to(() => Feedwritepage(userInformation: userInformation));
    } catch (e) {
      print('Error: $e');
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
        key: _formkey,
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
                // 입력 필수 에러
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력해주세요.';
                  }
                },
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
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
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
            errorText.isEmpty
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      errorText,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp),
                    ),
                  ),
            SizedBox(height: 10.h),
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
                      isChecked
                          ? null
                          : 
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Personalinformation()));
                      isChecked
                          ? null
                          :
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

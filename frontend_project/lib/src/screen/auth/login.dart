import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/screen/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // 로그인 시 필요한 formkey, 텍스트 입력시 입력한 아이디, 비밀번호 파악을 위한 controller 변수 생성
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 텍스트 버튼에서 텍스트 색상 변경을 위한 변수 생성
  Color _idButtonColor = Colors.grey;
  Color _passwordButtonColor = Colors.grey;
  Color _registerButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('로그인'),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(height: 170.h),
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
            // 아이디찾기 버튼
            // TODO: 보류로 하는게 나을것 같음. 일단 주요 기능만 만들어보기
            // Container(
            //   margin: EdgeInsets.only(left: 200.w),
            //   height: 16.h,
            //   child: TextButton(
            //       onPressed: () {
            //         // 버튼을 클릭하면 아이디찾기 창으로 이동
            //         Future.delayed(Duration.zero, () {
            //           Navigator.of(context).push(
            //               MaterialPageRoute(builder: (context) => Findid()));
            //         });
            //       },
            //       style: OutlinedButton.styleFrom(
            //         foregroundColor: Colors.white,
            //       ),
            //       // 버튼에 마우스오버를 했을 때 텍스트 색상 변경을 위함
            //       onHover: (hover) {
            //         setState(() {
            //           _idButtonColor =
            //               hover ? Color.fromRGBO(146, 1, 159, 1) : Colors.grey;
            //         });
            //       },
            //       child: Text(
            //         '아이디를 잊어버리셨나요?',
            //         style: TextStyle(color: _idButtonColor, fontSize: 10.w),
            //       )),
            // ),
            // 비밀번호 찾기
            // TODO: 보류로 하는게 나을것 같음. 일단 주요 기능 먼저 만들어보기
            // Container(
            //   margin: EdgeInsets.only(left: 190.w),
            //   height: 16.h,
            //   child: TextButton(
            //       onPressed: () {},
            //       style: OutlinedButton.styleFrom(
            //         foregroundColor: Colors.white,
            //       ),
            //       // 버튼에 마우스오버를 했을 때 텍스트 색상 변경을 위함
            //       onHover: (hover) {
            //         setState(() {
            //           _passwordButtonColor =
            //               hover ? Color.fromRGBO(146, 1, 159, 1) : Colors.grey;
            //         });
            //       },
            //       child: Text(
            //         '비밀번호를 잊어버리셨나요?',
            //         style:
            //             TextStyle(color: _passwordButtonColor, fontSize: 10.w),
            //       )),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 100.h, 20.w, 5.h),
              height: 55.h,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
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
            TextButton(
                onPressed: () {
                  // 버튼을 클릭하면 회원가입 창으로 이동
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  });
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                // 버튼에 마우스오버를 했을 때 텍스트 색상 변경을 위함
                onHover: (hover) {
                  setState(() {
                    _registerButtonColor =
                        hover ? Color.fromRGBO(146, 1, 159, 1) : Colors.grey;
                  });
                },
                child: Text(
                  '아직 계정이 없으신가요?',
                  style: TextStyle(color: _registerButtonColor, fontSize: 10.w),
                )),
            SizedBox(height: 130.h),
            Image.asset(
              'assets/logo.png',
              height: 33.h,
            )
          ],
        ),
      ),
    );
  }
}
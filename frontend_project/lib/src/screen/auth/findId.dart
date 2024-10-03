// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Findid extends StatefulWidget {
//   const Findid({super.key});

//   @override
//   State<Findid> createState() => _FindidState();
// }

// class _FindidState extends State<Findid> {
//   // 아이디찾을때 필요한 formkey, 텍스트 입력시 입력한 전화번호 파악을 위한 controller 변수 생성
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _checkNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
//     ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '아이디찾기',
//         ),
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: Form(
//         key: _formkey,
//         child: ListView(
//           children: [
//             SizedBox(height: 170.h),
//             Container(
//               margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
//               // 전화번호를 입력하는 입력창
//               child: TextFormField(
//                 controller: _phoneNumberController,
//                 decoration: InputDecoration(
//                   labelStyle: TextStyle(color: Colors.grey),
//                   labelText: '전화번호',
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
//               child: TextFormField(
//                 controller: _checkNumberController,
//                 decoration: InputDecoration(
//                   labelText: '인증번호',
//                   labelStyle: TextStyle(color: Colors.grey),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(20.w, 100.h, 20.w, 5.h),
//               height: 55.h,
//               child: OutlinedButton(
//                 onPressed: () {},
//                 child: Text(
//                   '로그인',
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(255, 255, 255, 1),
//                   ),
//                 ),
//                 style: OutlinedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: Color.fromRGBO(245, 208, 67, 1),
//                   side: BorderSide(
//                     width: 0.2,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 120.h),
//             Image.asset(
//               'assets/logo.png',
//               height: 33.h,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

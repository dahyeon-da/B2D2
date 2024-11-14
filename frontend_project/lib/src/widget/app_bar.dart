import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/controller/user_controller.dart';
import 'package:frontend_project/src/screen/auth/login.dart';
import 'package:frontend_project/src/screen/tapbarPage/myPage.dart';
import 'package:get/get.dart';

class App_bar extends StatefulWidget implements PreferredSizeWidget {
  final bool isLogin;

  const App_bar({super.key, required this.isLogin});

  @override
  State<App_bar> createState() => _App_barState();

  @override
  Size get preferredSize => Size.fromHeight(56.h); // AppBar의 높이를 지정
}

class _App_barState extends State<App_bar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return AppBar(
      title: Image.asset(
        'assets/B2D2_logo.png',
        height: 40.h,
      ),
      iconTheme: IconThemeData(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(245, 208, 67, 1),
      actions: [
        widget.isLogin
            ? IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Mypage()));
                },
                icon: Image.asset(
                  'assets/mypage.png',
                  height: 40.h,
                ),
              )
            : TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Login(isWrite: false)));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
        // IconButton(
        //   onPressed: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => Mypage()));
        //   },
        //   icon: Image.asset(
        //     'assets/mypage.png',
        //     height: 40.h,
        //   ),
        // )
      ],
    );
  }
}

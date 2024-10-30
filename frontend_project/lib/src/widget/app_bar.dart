import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/controller/user_controller.dart';
import 'package:get/get.dart';

class App_bar extends StatefulWidget implements PreferredSizeWidget {
  const App_bar({super.key});

  @override
  State<App_bar> createState() => _App_barState();

  @override
  Size get preferredSize => Size.fromHeight(56.h); // AppBar의 높이를 지정
}

class _App_barState extends State<App_bar> {
  final userController = Get.put(UserController());
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    // 로그인 여부 확인
    loginCheck();
  }

  loginCheck() async {
    isLogin = await userController.isLogin();
  }

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
        isLogin
            ? IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/mypage.png',
                  height: 40.h,
                ),
              )
            : SizedBox()
      ],
    );
  }
}

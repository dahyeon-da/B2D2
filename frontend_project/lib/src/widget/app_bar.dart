import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App_bar extends StatefulWidget implements PreferredSizeWidget {
  const App_bar({super.key});

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
        'assets/logo.png',
        height: 23.h,
      ),
      iconTheme: IconThemeData(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(245, 208, 67, 1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend_project/src/model/feedModel.dart';
import 'package:frontend_project/src/screen/auth/login.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedWritePage.dart';

class FeedWriteFloatingActionButton extends StatefulWidget {
  final bool isLogin;

  const FeedWriteFloatingActionButton({super.key, required this.isLogin});

  @override
  State<FeedWriteFloatingActionButton> createState() =>
      _FeedWriteFloatingActionButtonState();
}

class _FeedWriteFloatingActionButtonState
    extends State<FeedWriteFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(Icons.add_circle),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        iconSize: 50,
        onPressed: () {
          // 버튼을 클릭하면 피드 작성 페이지로 이동하기
          // 로그인이 되어있는지 확인하고 로그인이 안되어있으면 로그인 창으로 이동.
          Future.delayed(Duration.zero, () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(
            //     builder: (context) => widget.isLogin
            //         ? Feedwritepage(userInformation: Feedmodel('', ''))
            //         : Login()));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          });
        },
        color: Color.fromRGBO(97, 136, 84, 1),
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/widget/app_bar.dart';

class Feedwritepage extends StatefulWidget {
  const Feedwritepage({super.key});

  @override
  State<Feedwritepage> createState() => _FeedwritepageState();
}

class _FeedwritepageState extends State<Feedwritepage> {
  // 피드작성 시 필요한 formkey, 텍스트 입력시 입력한 글쓴이, 동아리명, 작성날짜, 작성내용, 이미지 파악을 위한 controller 변수 생성
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: App_bar(),
      body: ListView(
        children: [
          SizedBox(height: 10.h),
          Container(
            child: Text(
              '일지 작성',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          // 글쓴이 입력창
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '글쓴이',
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
          // 동아리명 입력창
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
            child: TextFormField(
              controller: _groupController,
              decoration: InputDecoration(
                labelText: '동아리명',
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
          // 작성일 입력창
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
            child: TextFormField(
              controller: _groupController,
              decoration: InputDecoration(
                labelText: '작성일',
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
          // 일지 내용 입력창
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
            child: TextFormField(
              maxLines: 10,
              controller: _groupController,
              decoration: InputDecoration(
                labelText: '일지 내용',
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
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
          Row(
            children: [
              SizedBox(width: 15.w),
              IconButton(
                onPressed: () {},
                highlightColor: Colors.transparent,
                icon: Container(
                  height: 100.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(189, 189, 189, 1),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

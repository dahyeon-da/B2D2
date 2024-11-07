import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/connect/feed_connect.dart';
import 'package:frontend_project/src/model/feedModel.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedPage.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Feedwritepage extends StatefulWidget {
  final Feedmodel userInformation;

  const Feedwritepage({super.key, required this.userInformation});

  @override
  State<Feedwritepage> createState() => _FeedwritepageState();
}

class _FeedwritepageState extends State<Feedwritepage> {
  final feedConnect = Get.put(FeedConnect());

  // 피드작성 시 필요한 formkey, 텍스트 입력시 입력한 글쓴이, 동아리명, 작성날짜, 작성내용, 이미지 파악을 위한 controller 변수 생성
  TextEditingController _nameController = TextEditingController();
  TextEditingController _groupController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late Map<String, dynamic> result;
  String _selectedDate = '';

  // 일지 작성 버튼을 누를 때 동작할 함수
  _submitForm() async {
    final String contentText = _contentController.text;

    print(widget.userInformation.memberName +
        widget.userInformation.memberGroup +
        _selectedDate +
        contentText);
    Get.to(Feedpage());

    result = await feedConnect.sendFeedWrite(
        widget.userInformation.memberName,
        widget.userInformation.memberGroup, _selectedDate, contentText);

    if (result != null && result.isNotEmpty) {
      Get.to(Feedpage());
    }
  }

  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
      print(_selectedImages[0]);
    }
  }

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
                prefixText: widget.userInformation.memberName,
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
                prefixText: widget.userInformation.memberGroup,
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
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.7, color: Colors.grey))),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '작성일',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate,
                        style: TextStyle(fontSize: 14.w),
                      ),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.date_range),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 일지 내용 입력창
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
            child: TextFormField(
              maxLines: 10,
              controller: _contentController,
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
                onPressed: _pickImage,
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
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _selectedImages.map((image) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Container(
                          height: 100.w,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(189, 189, 189, 1),
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 50.h,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 208, 67, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.5, color: Colors.grey),
            ),
            child: TextButton(
              onPressed: _submitForm,
              child: Text(
                '일지 작성',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 136, 84, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h)
        ],
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

    if (selected != null) {
      setState(() {
        _selectedDate = (DateFormat('yyyy/MM/dd')).format(selected);
      });
    }
  }
}

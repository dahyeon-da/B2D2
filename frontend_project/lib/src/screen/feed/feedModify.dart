import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/shared/global.dart';
import 'package:frontend_project/src/connect/feed_connect.dart';
import 'package:frontend_project/src/connect/image_connect.dart';
import 'package:frontend_project/src/screen/tapbarPage/myPage.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Feedmodify extends StatefulWidget {
  final Map<String, dynamic> userInformation;

  const Feedmodify({super.key, required this.userInformation});

  @override
  State<Feedmodify> createState() => _FeedmodifyState();
}

class _FeedmodifyState extends State<Feedmodify> {
  final feedConnect = Get.put(FeedConnect());
  final imageConnect = Get.put(ImageConnect());

  String _selectedDate = '';
  List _selectedImages = [];
  List<File> _uploadImages = [];
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.userInformation['boardDate'];
    _contentController.text = widget.userInformation['boardContent'];
    _selectedImages = widget.userInformation['images'] ?? [];
  }

  Future<void> _pickImage() async {
    // 여러 이미지 선택 가능
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null) {
      setState(() {
        // 선택된 이미지를 리스트에 추가
        _uploadImages
            .addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
      });
      print('Selected images: ${_uploadImages.length}');
    }
  }

  updateFeed() async {
    try {
      Map<String, dynamic> feedResult = await feedConnect.sendFeedUpdate(
          widget.userInformation['boardNum'],
          _selectedDate,
          _contentController.text);
      if (_uploadImages.isNotEmpty || _uploadImages == []) {
        if (feedResult.isNotEmpty || feedResult == '') {
          Get.back();
        }
      }
      Map<String, dynamic> imageResult = await imageConnect.uploadImage(
          widget.userInformation['boardNum'], _uploadImages);
      if (imageResult.isNotEmpty || imageResult == '') {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Mypage()),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  final TextEditingController _contentController = TextEditingController();

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
              '일지 수정',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          // 글쓴이
          Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '글쓴이',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  Text(
                    widget.userInformation['boardWriter'],
                  ),
                ],
              )),
          // 동아리명
          Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 7.h),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '글쓴이',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  Text(
                    widget.userInformation['boardWriterGroup'],
                  ),
                ],
              )),
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
          // 이미지 선택 부분
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
              // 원래 이미지 띄우기
              (_selectedImages == null || _selectedImages.isEmpty)
                  ? Container()
                  : Container(
                      height: 100.w,
                      width: 100.w,
                      child: ListView.builder(
                        itemCount: _selectedImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            '${Global.apiRoot}/api/v2/images/${_selectedImages[index]}',
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Text('이미지를 불러오는 중 오류가 발생했습니다.');
                            },
                          );
                        },
                      ),
                    ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _uploadImages.map((image) {
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
              onPressed: updateFeed,
              child: Text(
                '일지 수정',
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/connect/feedConnect.dart';
import 'package:frontend_project/src/screen/introduce/b2d2Introduce.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:frontend_project/src/widget/feed_box.dart';
import 'package:frontend_project/src/widget/feed_write_floating_action_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final feedConnect = Get.put(FeedConnect());

class Feedpage extends StatefulWidget {
  const Feedpage({super.key});

  @override
  State<Feedpage> createState() => _FeedpageState();
}

class _FeedpageState extends State<Feedpage> {
  bool isLoading = true;
  List<Map<String, dynamic>> feedData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    _imageController = PageController();
  }

  // 날짜 데이터를 포맷화하는 함수
  String formDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    List<dynamic> results = await feedConnect.FeedList();

    feedData = results.map((result) {
      return {
        'boardNum': result['boardNum'],
        'boardWriter': result['boardWriter'],
        'boardWriterGroup': result['boardWriterGroup'],
        'boardDate': formDate(result['boardDate']),
        'boardContent': result['boardContent'],
        'images': result['images']?.split(',')
      };
    }).toList();

    setState(() {
      isLoading = false;
      print(feedData);
    });
  }

  late final PageController _imageController;

  List<String> _groupList = ['B2D2', '지킴이', '달리'];
  var _selectedValue = 'B2D2';

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: App_bar(),
        floatingActionButton: FeedWriteFloatingActionButton(),
        body: isLoading
            ? Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '로딩중입니다...',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          IconButton(
                            onPressed: () {},
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(45.w),
                              child: Image.asset(
                                'assets/instagram.png',
                                height: 70.w,
                                width: 70.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '시흥청소년 재단 소개',
                            style: TextStyle(fontSize: 11.sp),
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          IconButton(
                            onPressed: () {},
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(45.w),
                              child: Image.asset(
                                'assets/instagram.png',
                                height: 70.w,
                                width: 70.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '시화호 청소년 환경\n감시단 소개',
                            style: TextStyle(fontSize: 11.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          IconButton(
                            onPressed: () {
                              // 버튼을 클릭하면 B2D2 소개글 창으로 이동
                              Future.delayed(Duration.zero, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => B2d2Introduce()));
                              });
                            },
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(45.w),
                              child: Image.asset(
                                'assets/instagram.png',
                                height: 70.w,
                                width: 70.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '디지털환경감시단\nB2D2 소개',
                            style: TextStyle(fontSize: 11.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 170.w, 10.h),
                    color: Color.fromRGBO(217, 217, 217, 1),
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          itemHeight: 48.0,
                          underline: SizedBox.shrink(),
                          icon: Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          alignment: Alignment.center,
                          focusColor: Colors.white,
                          dropdownColor: Colors.white,
                          value: _selectedValue,
                          items: _groupList.map(
                            (value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          }),
                    ),
                  ),
                  FeedBox(feedData: feedData)
                ],
              )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_project/src/connect/feed_connect.dart';
import 'package:frontend_project/src/controller/user_controller.dart';
import 'package:frontend_project/src/screen/introduce/b2d2Introduce.dart';
import 'package:frontend_project/src/screen/introduce/environmentalMonitoringIntroduce.dart';
import 'package:frontend_project/src/screen/introduce/siheungIntroduce.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:frontend_project/src/widget/feed_box.dart';
import 'package:frontend_project/src/widget/feed_write_floating_action_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class Feedpage extends StatefulWidget {
  const Feedpage({super.key});

  @override
  State<Feedpage> createState() => _FeedpageState();
}

final GetStorage _storage = GetStorage();

class _FeedpageState extends State<Feedpage> {
  final feedConnect = Get.put(FeedConnect());
  final userController = Get.put(UserController());
  final storage = new FlutterSecureStorage();

  bool isLoading = true;
  List<Map<String, dynamic>> feedData = [];
  bool isLogin = false;
  bool feedDataNull = false;
  String memberName = '';

  // 페이지가 열릴때마다 로그인 여부를 확인

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

  Future<void> fetchData([group_num = 0]) async {
    setState(() {
      isLoading = true;
    });

    List<dynamic> results = await feedConnect.FeedList(group_num);
    isLogin = await userController.isLogin();
    memberName = await storage.read(key: 'memberName') ?? '';

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
      feedDataNull = feedData.isEmpty;
    });
  }


  late final PageController _imageController;

  List<String> _groupList = ['전체', 'B2D2', '그린웨일', '지킴이', 'B.S.A.S', '달리'];
  var _selectedValue = '전체';

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
        appBar: App_bar(isLogin: isLogin),
        floatingActionButton: FeedWriteFloatingActionButton(isLogin: isLogin),
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
            : RefreshIndicator(
                onRefresh: () async {
                  await fetchData();
                },
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 5.h),
                              IconButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Siheungintroduce())),
                                icon: Container(
                                  height: 70.w,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35.w),
                                  ),
                                  child: Image.asset(
                                    'assets/siheung_logo.png',
                                    height: 70.w,
                                    width: 70.w,
                                  ),
                                ),
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              Text(
                                '시흥청소년재단 소개',
                                style: TextStyle(fontSize: 11.sp),
                              )
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            children: [
                              SizedBox(height: 5.h),
                              IconButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Environmentalmonitoringintroduce())),
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45.w),
                                  ),
                                  child: Image.asset(
                                    'assets/sihwaho.png',
                                    height: 70.w,
                                    width: 70.w,
                                  ),
                                ),
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              Text(
                                '시화호청소년환경감시단 소개',
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                B2d2Introduce()));
                                  });
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45.w),
                                  ),
                                  child: Image.asset(
                                    'assets/B2D2.png',
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
                                if (_selectedValue != value && value != null) {
                                  int i = _groupList.indexOf(value);
                                  fetchData(i);
                                }
                                _selectedValue = value!;
                              });
                            }),
                      ),
                    ),
                    feedDataNull
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                '일지가 없습니다.',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        : FeedBox(
                            feedData: feedData,
                            myFeed: false,
                            memberName: memberName.isEmpty ? '' : memberName,
                            isFeedPage: true
                          ),
                  ],
                )),
              ));
  }
}

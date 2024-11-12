import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_project/src/connect/feed_connect.dart';
import 'package:frontend_project/src/connect/user_connect.dart';
import 'package:frontend_project/src/widget/app_bar.dart';
import 'package:frontend_project/src/widget/feed_box.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  final userConnect = Get.put(UserConnect());
  final feedConnect = Get.put(FeedConnect());

  TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final storage = new FlutterSecureStorage();
  String? memberId;
  String? memberName;
  String? memberGroup;
  bool isLoading = true;
  List<Map<String, dynamic>> feedData = [];
  bool isUpdateSuccessful = false;
  bool passwordCheck = false;
  bool passwordError = false;

  late Map<String, dynamic> updateResults;
  late List<dynamic> feedsMineResults;

  @override
  void initState() {
    super.initState();
    getInformation();
    patchData();
  }

  Future patchData() async {
    feedsMineResults = await feedConnect.sendFeedsMine();

    setState(() {
      feedData = feedsMineResults.map((result) {
        return {
          'boardNum': result['boardNum'],
          'boardWriter': result['boardWriter'],
          'boardWriterGroup': result['boardWriterGroup'],
          'boardDate': formDate(result['boardDate']),
          'boardContent': result['boardContent'],
          'images': result['images']?.split(',')
        };
      }).toList();
    });
  }

  // 날짜 데이터를 포맷화하는 함수
  String formDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  Future getInformation() async {
    memberName = await storage.read(key: 'memberName');
    memberGroup = await storage.read(key: 'memberGroup');
    memberId = await storage.read(key: 'memberId');

    setState(() {
      _nameController.text = memberName == '' ? '오류' : memberName!;
      _selectedGroup = memberGroup == '' ? 'B2D2' : memberGroup!;
      isLoading = false;
    });
  }

  // 수정완료 버튼을 누를 때 동작할 함수
  _submitForm() async {
    late String name;
    try {
      if (_passwordCheckController.text == _passwordController.text) {
        passwordCheck = true;
      } else {
        passwordCheck = false;
      }
      if (_nameController.text == null || _nameController.text.isEmpty) {
        name = memberName!;
      } else {
        name = _nameController.text;
      }
      final String group = _selectedGroup;
      final String password = _passwordController.text;

      if (passwordCheck) {
        updateResults = await userConnect.sendUpdateUser(name, password, group);
      }

      if (updateResults == null || updateResults.isEmpty) {
        passwordError = true;
      }

      setState(() {
        isUpdateSuccessful = true;
      });
    } catch (e) {
      print('Error $e');
    }
  }

  List<String> _groupList = ['B2D2', '지킴이', '달리', 'B.S.A.S', '그린웨일'];
  var _selectedGroup;

  bool nameUpdate = true;
  bool passwordUpdate = true;
  bool groupUpdate = true;

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return isLoading
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
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: App_bar(),
            body: ListView(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Text(
                        '아이디',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Text(
                        memberId == '' ? '오류' : memberId!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text(
                            '이름',
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              nameUpdate = false;
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 20.h,
                          ),
                        ),
                      ],
                    ),
                    nameUpdate
                        ? Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              memberName == '' ? '오류' : memberName!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: '이름',
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
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '동아리',
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                groupUpdate = false;
                                // TODO: update api에 변경할 동아리를 넣어야 함.
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    groupUpdate
                        ? Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              memberGroup == '' ? '오류' : memberGroup!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                                itemHeight: 48.0,
                                underline: SizedBox.shrink(),
                                icon: Icon(Icons.keyboard_arrow_down),
                                isExpanded: true,
                                alignment: Alignment.centerLeft,
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                value: _selectedGroup,
                                items: _groupList.map(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGroup = value!;
                                  });
                                }),
                          ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Row(
                            children: [
                              Text(
                                '비밀번호',
                                style: TextStyle(fontSize: 17.sp),
                              ),
                              Text(
                                '  ※필수로 작성※',
                                style: TextStyle(fontSize: 12.sp),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              passwordUpdate = false;
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 20.h,
                          ),
                        ),
                      ],
                    ),
                    passwordUpdate
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: '비밀번호',
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
                    passwordUpdate
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: TextFormField(
                              controller: _passwordCheckController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: '비밀번호확인',
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
                    !passwordCheck && passwordUpdate
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              !passwordCheck
                                  ? (passwordError
                                      ? '비밀번호는 영문, 숫자, 특수문자(!, @, #, \$, %, ^, &, *, (, ), _, +, -, =, {, }, [, ], |, :, ;, \", \', <, >, ,, ., ?, /, ~, `)를 포함한 8자 이상의 문자로 이뤄져야 합니다.'
                                      : '비밀번호가 일치하지 않습니다.')
                                  : '', // 비밀번호가 일치하면 아무것도 표시하지 않음
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 10.sp),
                            ),
                          ),

                    nameUpdate && groupUpdate && passwordUpdate
                        ? Container()
                        : Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                            child: TextButton(
                              onPressed: _submitForm,
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(255, 212, 58, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: Text(
                                '수정완료',
                                style: TextStyle(
                                    color: Color.fromRGBO(97, 136, 84, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                    if (isUpdateSuccessful)
                      Center(
                        child: Text(
                          '수정이 완료되었습니다.',
                          style:
                              TextStyle(color: Colors.green, fontSize: 16.sp),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    FeedBox(
                      feedData: feedData,
                      myFeed: true,
                    )
                  ],
                ),
              ],
            ),
          );
  }
}

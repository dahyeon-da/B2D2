import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/shared/global.dart';
import 'package:frontend_project/src/connect/feed_connect.dart';
import 'package:frontend_project/src/screen/feed/feedModify.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedPage.dart';
import 'package:frontend_project/src/screen/tapbarPage/myPage.dart';
import 'package:frontend_project/src/widget/imageView.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FeedBox extends StatefulWidget {
  final List<Map<String, dynamic>> feedData;
  final bool myFeed;

  const FeedBox({super.key, required this.feedData, required this.myFeed});

  @override
  State<FeedBox> createState() => _FeedBoxState();
}

class _FeedBoxState extends State<FeedBox> {
  final feedConnect = Get.put(FeedConnect());
  List<Map<String, dynamic>> feedData = [];

  @override
  void initState() {
    super.initState();
    fetchData;
  }

  fetchData() async {
    try {
      final results = await feedConnect.FeedList();
      setState(() {
        feedData = List<Map<String, dynamic>>.from(results.map((result) {
          return {
            'boardNum': result['boardNum'],
            'boardWriter': result['boardWriter'],
            'boardWriterGroup': result['boardWriterGroup'],
            'boardDate': formDate(result['boardDate']),
            'boardContent': result['boardContent'],
            'images': result['images']?.split(',') ?? [],
          };
        }));
      });
    } catch (e) {
      print("데이터 로드 중 오류 발생: $e");
    }
  }

  // 날짜 데이터를 포맷화하는 함수
  String formDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Column(
      children: widget.feedData.map((item) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 7),
              )
            ],
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5.w),
                        child: Text(
                          item['boardDate'],
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: Text(
                              '${item['boardWriter']}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: Text(
                              '${item['boardWriterGroup']}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                heightFactor: 0.8,
                                child: Imageview(imageAssets: item['images']),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.image_outlined,
                          size: 23,
                        ),
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: EdgeInsets.all(5.w),
                        constraints: BoxConstraints(),
                      ),
                      widget.myFeed
                          ? Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => Feedmodify())),
                                  icon: Image.asset(
                                    'assets/modify.png',
                                    width: 20.h,
                                  ),
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  padding: EdgeInsets.all(5.w),
                                  constraints: BoxConstraints(),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Map<String, dynamic> result =
                                        await feedConnect
                                            .sendFeedDelete(item['boardNum']);

                                    if (result.isNotEmpty) {
                                      fetchData();
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Mypage()),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.delete),
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  padding: EdgeInsets.all(5.w),
                                  constraints: BoxConstraints(),
                                )
                              ],
                            )
                          : Container(),
                      SizedBox(width: 10.w)
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 350.h,
                width: 350.h,
                child: (item['images'] == null ||
                        item['images'].isEmpty) // 배열이 비어 있는지 체크
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/no_photo.png',
                                  height: 100.h, width: 100.h),
                              Text(
                                'No image',
                                style: TextStyle(
                                    color: Color.fromRGBO(175, 175, 175, 1)),
                              )
                            ]),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item['images'].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            '${Global.apiRoot}/api/v2/images/${item['images'][index]}',
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
              SizedBox(width: 8.w),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                child: Container(
                  margin: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                  width: double.infinity,
                  child: ExpandableText(
                    item['boardContent'],
                    style: TextStyle(fontSize: 13.sp),
                    maxLines: 3,
                    expandText: '더보기',
                    collapseText: '접기',
                    linkColor: const Color.fromARGB(255, 2, 71, 128),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      }).toList(),
    );
  }
}

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/screen/introduce/b2d2Introduce.dart';
import 'package:frontend_project/src/widget/imageView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Feedpage extends StatefulWidget {
  const Feedpage({super.key});

  @override
  State<Feedpage> createState() => _FeedpageState();
}

class _FeedpageState extends State<Feedpage> {
  late final PageController _imageController;
  final List<String> imageAssets = [
    'assets/instagram.png',
    'assets/feedEx.png',
    'assets/instagram.png',
    'assets/instagram.png',
    'assets/instagram.png',
  ];

  @override
  void initState() {
    super.initState();
    _imageController = PageController();
  }

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
      appBar: AppBar(
        actions: [
          Image.asset('assets/logo.png', height: 23.h),
          SizedBox(width: 10.w),
        ],
        backgroundColor: const Color.fromRGBO(245, 208, 67, 1),
      ),
      body: imageAssets.isNotEmpty
          ? ListView(
              children: [
                SizedBox(height: 6.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.w),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(45.w),
                              child: Image.asset(
                                'assets/instagram.png',
                                height: 90.w,
                                width: 90.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '시흥청소년 재단 소개',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(45.w),
                              child: Image.asset(
                                'assets/instagram.png',
                                height: 90.w,
                                width: 90.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '시화호 청소년 환경\n감시단 소개',
                            style: TextStyle(fontSize: 15.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        children: [
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
                                height: 90.w,
                                width: 90.w,
                              ),
                            ),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Text(
                            '디지털환경감시단\nB2D2 소개',
                            style: TextStyle(fontSize: 15.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      SizedBox(width: 10.w)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 7),
                      )
                    ],
                    color: Colors.white,
                  ),
                  width: double.infinity,
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
                                  '2024-06-14',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      child: Text(
                                        '이다현',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    child: Text(
                                      '메카트로닉스',
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                                
                              ),
                              SizedBox(height: 5.h),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.8,
                                    child: Imageview(imageAssets: imageAssets),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.image_outlined),
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 380.w,
                            child: PageView.builder(
                              controller: _imageController,
                              itemCount: imageAssets.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  imageAssets[index],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 200.h,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                if (_imageController.hasClients &&
                                    _imageController.page! > 0) {
                                  _imageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 200.h,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (_imageController.hasClients &&
                                    _imageController.page! <
                                        imageAssets.length - 1) {
                                  _imageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ),
                          
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          controller: _imageController,
                          count: imageAssets.length,
                          effect: SwapEffect(
                            dotHeight: 4,
                            dotWidth: 4,
                            activeDotColor:
                                const Color.fromARGB(255, 131, 226, 255),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: ExpandableText(
                          '2024-09-20\n 조류 관찰일지입니다.ㅇㅇ새, ㅁㅁ새, ㄱㄱ새, ㅎㅎ새, ㅌㅌ새를 관찰했습니다. 다음 활동에는 ㄹㄹ새, ㄴㄴ새, ㅈㅈ새를 관찰할 예정입니다.',
                          style: TextStyle(fontSize: 15.sp),
                          maxLines: 3,
                          expandText: '더보기',
                          collapseText: '접기',
                          linkColor: const Color.fromARGB(255, 2, 71, 128),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            )
          : const Center(child: Text('이미지가 없습니다')),
    );
  }
}

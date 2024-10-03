import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/widget/comment_post.dart';

class Feedpage extends StatelessWidget {
  const Feedpage({super.key});

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
          Image.asset(
            'assets/search.png',
            height: 23.h,
          ),
          SizedBox(width: 10.w)
        ],
        backgroundColor: Color.fromRGBO(245, 208, 67, 1),
      ),
      body: ListView(
        children: [
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
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '이다닷',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '메카트로닉스',
                              style: TextStyle(fontSize: 12.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          // TODO: 버튼을 누르면 신고 창으로 이동
                          IconButton(
                            icon: Image.asset(
                              'assets/report.png',
                              height: 25.h,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            onPressed: () {},
                            hoverColor: Colors.white,
                          ),
                          // TODO: 버튼을 누르면 공유 창으로 이동
                          IconButton(
                            icon: Image.asset(
                              'assets/share.png',
                              height: 20.h,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            hoverColor: Colors.white,
                            onPressed: () {},
                          ),
                          // TODO: 버튼을 누르면 더보기 창으로 이동
                          IconButton(
                            icon: Image.asset(
                              'assets/menu.png',
                              height: 25,
                            ),
                            hoverColor: Colors.white,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 5.w),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/clickMyPage.png',
                  width: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text(
                    '2024-06-14',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    // TODO: 좋아요 기능 만들기
                    IconButton(
                      icon: Image.asset(
                        'assets/heart.png',
                        height: 20.h,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      hoverColor: Colors.white,
                      onPressed: () {},
                    ),
                    Text(
                      '51',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 8.w),
                    IconButton(
                      icon: Image.asset(
                        'assets/comment.png',
                        height: 20.h,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      hoverColor: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommentPost();
                          },
                        );
                      },
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(width: 8.w),
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text(
                    '2024-09-20\n 조류 관찰일지입니다.ㅇㅇ새, ㅁㅁ새, ㄱㄱ새, ㅎㅎ새, ㅌㅌ새를 관찰했습니다. 다음 활동에는 ㄹㄹ새, ㄴㄴ새, ㅈㅈ새를 관찰할 예정입니다.',
                    style: TextStyle(fontSize: 15.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 100,
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
          SizedBox(height: 20.h),
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
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '이다닷',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '메카트로닉스',
                              style: TextStyle(fontSize: 10.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/report.png',
                              height: 25.h,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            onPressed: () {},
                            hoverColor: Colors.white,
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/share.png',
                              height: 20.h,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            hoverColor: Colors.white,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/menu.png',
                              height: 25,
                            ),
                            hoverColor: Colors.white,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 5.w),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/clickMyPage.png',
                  width: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text(
                    '2024-06-14',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    Image.asset(
                      'assets/heart.png',
                      height: 20.h,
                    ),
                    Text(
                      '51',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 8.w),
                    IconButton(
                      icon: Image.asset(
                        'assets/comment.png',
                        height: 20.h,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      hoverColor: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommentPost();
                          },
                        );
                      },
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(width: 8.w),
                Container(
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text(
                    '2024-09-20\n 조류 관찰일지입니다.ㅇㅇ새, ㅁㅁ새, ㄱㄱ새, ㅎㅎ새, ㅌㅌ새를 관찰했습니다. 다음 활동에는 ㄹㄹ새, ㄴㄴ새, ㅈㅈ새를 관찰할 예정입니다.',
                    style: TextStyle(fontSize: 15.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 100,
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
          SizedBox(height: 20.h)
        ],
      ),
    );
  }
}

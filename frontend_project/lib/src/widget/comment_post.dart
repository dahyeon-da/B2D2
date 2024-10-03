import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentPost extends StatefulWidget {
  const CommentPost({super.key});

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      backgroundColor: Colors.white,
      content: SizedBox(
        width: double.maxFinite,
        height: 700.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Text(
                    '댓글 30',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/close.png',
                      height: 15.h,
                      alignment: Alignment.topRight,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    hoverColor: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Container(
              width: double.infinity,
              height: 1.h,
              color: Color.fromRGBO(133, 133, 133, 1),
            ),
            Container(
              height: 600.h,
              width: double.maxFinite,
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '이다닷',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Text(
                            '우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~우와 엄청 열심히 활동하셨네요~~',
                            style: TextStyle(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TODO: 이건 폰에 띄워서 수정해야할듯
            TextField()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/shared/global.dart';

class Imageview extends StatefulWidget {
  final List imageAssets;

  const Imageview({required this.imageAssets, Key? key}) : super(key: key);

  @override
  State<Imageview> createState() => _ImageviewState();
}

class _ImageviewState extends State<Imageview> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageAssets.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 350.h,
                width: 350.h,
                child: (widget.imageAssets == null ||
                        widget.imageAssets.isEmpty) // 배열이 비어 있는지 체크
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
                        itemCount: widget.imageAssets[index].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            '${Global.apiRoot}/api/v2/images/${widget.imageAssets[index]}',
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
              );
            },
          ),
        ],
      ),
    );
  }
}

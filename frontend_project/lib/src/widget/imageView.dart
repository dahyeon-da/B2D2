import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              return Container(
                color: Colors.black, // 기본 배경을 검정색으로 설정
                child: Center(
                  child: Image.asset(
                    widget.imageAssets[index],
                    fit: BoxFit.contain, // 원본 비율을 유지하며 맞춤
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 16,
            top: 300.h,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                if (_pageController.hasClients && _pageController.page! > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Positioned(
            right: 16,
            top: 300.h,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                if (_pageController.hasClients &&
                    _pageController.page! < widget.imageAssets.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

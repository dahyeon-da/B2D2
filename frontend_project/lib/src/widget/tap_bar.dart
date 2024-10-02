import 'package:flutter/material.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedPage.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedWritePage.dart';
import 'package:frontend_project/src/screen/tapbarPage/myPage.dart';
import 'package:frontend_project/src/screen/tapbarPage/plusPage.dart';

class Tapbar extends StatefulWidget {
  const Tapbar({Key? key}) : super(key: key);

  @override
  State<Tapbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tapbar> {
  int _selectedIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _widgetOptions = <Widget>[
    Feedpage(),
    Feedwritepage(),
    Mypage(),
    Pluspage(),
  ]; // 선택된 tabbar마다 띄울 페이지 배열

  final List<List<String>> _tabIcons = <List<String>>[
    ['assets/feedPage.png', 'assets/clickFeedPage.png'],
    ['assets/feedWritePage.png', 'assets/clickFeedWritePage.png'],
    ['assets/myPage.png', 'assets/clickMyPage.png'],
    ['assets/plusPage.png', 'assets/clickPlusPage.png'],
  ];

  final List<String> _tabLabels = <String>['홈', '글작성', '내정보', '더보기'];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          for (var i = 0; i < _widgetOptions.length; i++)
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == i ? _tabIcons[i][1] : _tabIcons[i][0],
                width: 35,
                height: 35,
              ),
              label: _tabLabels[i],
            ),
        ],
        selectedItemColor: Colors.black,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

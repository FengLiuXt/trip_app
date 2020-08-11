import 'package:flutter/material.dart';
import 'package:trip_app/pages/home_page.dart';
import 'package:trip_app/pages/my_page.dart';
import 'package:trip_app/pages/search_page.dart';
import 'package:trip_app/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabNavigatorState();
}

class TabNavigatorState extends State {
  int _currentIndex = 0;
  Color _defaultColor = Colors.grey;
  Color _activeColor = Colors.blue;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Scaffold(
      body: PageView(
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        reverse: false,
        controller: _pageController,
        onPageChanged: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );

    MediaQuery.of(context).removePadding(removeTop: true);
    return widget;
  }

  //底部导航
  BottomNavigationBar _getBottomNavigationBar() => BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _bottomItem(Icons.home, "首页", 0),
          _bottomItem(Icons.search, "搜索", 1),
          _bottomItem(Icons.camera_alt, "旅拍", 2),
          _bottomItem(Icons.account_circle, "我的", 3)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
            ;
          });
        },
      );

  //底部导航item
  BottomNavigationBarItem _bottomItem(
          IconData icon, String title, int number) =>
      BottomNavigationBarItem(
          icon: Icon(
            icon,
            color: _defaultColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: _currentIndex == number ? _activeColor : _defaultColor,
            ),
          ),
          activeIcon: Icon(icon, color: _activeColor));
}

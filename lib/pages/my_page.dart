import 'package:flutter/material.dart';
import 'package:trip_app/widget/webview_widget.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  final url = "https://m.ctrip.com/webapp/myctrip/";
  @override
  Widget build(BuildContext context) => WebViewWidget(url);
  @override
  bool get wantKeepAlive => true;
}

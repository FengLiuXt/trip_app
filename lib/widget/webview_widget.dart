import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  String _url;
  final TAG = "WEB_REQUEST";
  WebViewWidget(this._url);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.transparent,
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (url) {
          debugPrint("$TAG:$url");
        },
      ));
}

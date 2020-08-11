import 'package:flutter/material.dart';
import 'package:trip_app/model/home_model.dart';
import 'package:trip_app/widget/webview_widget.dart';

class LocalNavWidget extends StatelessWidget {
  List<LocalNavList> _list;

  LocalNavWidget(this._list);

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _getItems(context),
      ));

  _getItems(BuildContext context) {
    List<Widget> _widgets = [];

    _list.forEach((element) {
      var widget = GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewWidget(element.url)));
        },
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Column(
              children: <Widget>[
                Image(
                  image: NetworkImage(element.icon),
                  width: 32,
                  height: 32,
                ),
                Text(element.title)
              ],
            )),
      );
      _widgets.add(widget);
    });

    return _widgets;
  }
}

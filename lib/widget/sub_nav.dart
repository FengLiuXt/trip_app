import 'package:flutter/material.dart';
import 'package:trip_app/model/home_model.dart';

class SubNav extends StatelessWidget {
  List<SubNavList> subNavList;

  SubNav(this.subNavList);

  @override
  Widget build(BuildContext context) {
    var list = _getItems();

    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(children: list.sublist(0, (list.length / 2).toInt())),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: list.sublist((list.length / 2).toInt())),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    var items = <Widget>[];
    for (var value in subNavList) {
      var item = _getItem(value);
      items.add(item);
    }

    return items;
  }

  _getItem(SubNavList subNavList) => Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Image(
            width: 18,
            height: 18,
            image: NetworkImage(subNavList.icon),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              subNavList.title,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ));
}

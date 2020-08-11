import 'package:flutter/material.dart';
import 'package:trip_app/model/home_model.dart';

class GridNavWidget extends StatelessWidget {
  Hotel hotel;
  Flight flight;
  Travel travel;

  GridNavWidget(this.hotel, this.flight, this.travel);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(height: 88, child: _getHotelGridNav(hotel)),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Container(
              height: 88,
              child: _getFlightGridNav(flight),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 3),
              child: Container(height: 88, child: _getTravelGridNav(travel))),
        ],
      );

  _getHotelGridNav(Hotel hotel) => DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            gradient: LinearGradient(colors: [
              Color(int.parse("0xff" + hotel.startColor)),
              Color(int.parse("0xff" + hotel.endColor))
            ])),
        child: GridNavItem(
            mainItem: hotel.mainItem,
            item1: hotel.item1,
            item2: hotel.item2,
            item3: hotel.item3,
            item4: hotel.item4),
      );

  _getFlightGridNav(Flight flight) => DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(int.parse("0xff" + flight.startColor)),
        Color(int.parse("0xff" + flight.endColor))
      ])),
      child: GridNavItem(
          mainItem: flight.mainItem,
          item1: flight.item1,
          item2: flight.item2,
          item3: flight.item3,
          item4: flight.item4));

  _getTravelGridNav(Travel travel) => DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
          gradient: LinearGradient(colors: [
            Color(int.parse("0xff" + travel.startColor)),
            Color(int.parse("0xff" + travel.endColor))
          ])),
      child: GridNavItem(
          mainItem: travel.mainItem,
          item1: travel.item1,
          item2: travel.item2,
          item3: travel.item3,
          item4: travel.item4));
}

class GridNavItem extends StatelessWidget {
  MainItem mainItem;
  Item1 item1;
  Item2 item2;
  Item3 item3;
  Item4 item4;

  GridNavItem({this.mainItem, this.item1, this.item2, this.item3, this.item4});

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: _getLeft(mainItem.title, mainItem.icon, mainItem.url)),
          Expanded(
            flex: 1,
            child: _getCenter(item1.title, item1.url, item2.title, item2.url),
          ),
          Expanded(
            flex: 1,
            child: _getRight(item3.title, item3.url, item4.title, item4.url),
          )
        ],
      );

  _getLeft(String title, String icon, String url) => DecoratedBox(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1, color: Colors.white))),
        child: Stack(
          children: <Widget>[
            Align(
              child: Image.network(icon),
              alignment: Alignment.bottomCenter,
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      );

  _getCenter(String title1, String url1, String title2, String url2) =>
      DecoratedBox(
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white, width: 1))),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 1))),
                      child: Center(
                          child: Text(title1,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white))))),
              Expanded(
                  flex: 1,
                  child: Center(
                      child:
                          Text(title2, style: TextStyle(color: Colors.white)))),
            ],
          ));

  _getRight(String title3, String url3, String title4, String url4) => Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1))),
                  child: Center(
                      child: Text(
                    title3,
                    style: TextStyle(color: Colors.white),
                  )))),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                title4,
                style: TextStyle(color: Colors.white),
              )))
        ],
      );
}

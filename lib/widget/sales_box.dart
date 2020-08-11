import 'package:flutter/material.dart';
import 'package:trip_app/model/home_model.dart';

class SalesBoxWidget extends StatelessWidget {
  SalesBox salesBox;
  var divideColor = Colors.black12;
  var divideWidth = 0.5;

  SalesBoxWidget(this.salesBox);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
          child: Column(
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: divideColor, width: divideWidth))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(height: 15, image: NetworkImage(salesBox.icon)),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              gradient: LinearGradient(colors: [
                                Color(0xffff4e63),
                                Color(0xffff6cc9)
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                            child: Text("获取更多福利 >",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        )
                      ],
                    ),
                  )),
              DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: divideColor, width: divideWidth))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: divideColor,
                                            width: divideWidth))),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0.5),
                                  child: Image(
                                      fit: BoxFit.fitWidth,
                                      image:
                                          NetworkImage(salesBox.bigCard1.icon)),
                                ))),
                        Flexible(
                          flex: 1,
                          child: Image(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(salesBox.bigCard2.icon)),
                        ),
                      ],
                    ),
                  )),
              DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: divideColor, width: divideWidth))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: divideColor,
                                            width: divideWidth))),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0.5),
                                  child: Image(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          salesBox.smallCard1.icon)),
                                ))),
                        Flexible(
                            flex: 1,
                            child: Image(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(salesBox.smallCard2.icon)))
                      ],
                    ),
                  )),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: divideColor, width: divideWidth))),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.5),
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(salesBox.smallCard3.icon),
                          ),
                        )),
                  ),
                  Flexible(
                    flex: 1,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(salesBox.smallCard4.icon),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}

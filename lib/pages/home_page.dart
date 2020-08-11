import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip_app/model/home_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/precenter/base_precenter.dart';
import 'package:trip_app/precenter/home_pager_precenter.dart';
import 'package:trip_app/widget/grid_nav.dart';
import 'package:trip_app/widget/local_nav.dart';
import 'package:trip_app/widget/sales_box.dart';
import 'package:trip_app/widget/sub_nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {

    return _HomePageState();
  }
}

class _HomePageState extends BaseState<HomeModel> {
  HomeModel _homeModel;

  @override
  Widget getSuccesfulWidget() => _getWidget(context);

  @override
  IBasePrecenter getPrecenter() => HomePagePrecenter(this);

  @override
  void loadSuccessful(HomeModel value) {
    super.loadSuccessful(value);
    setState(() {
      _homeModel = value;
    });
  }

  Widget _getWidget(BuildContext context) => Container(
      color: Colors.grey[300],
      child: Stack(children: [
        _getListView(context),
        _getAppBar(),
      ]));

  _getAppBar() => Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text(
            "上海",
            style: TextStyle(fontSize: 14),
          )
        ],
      ));

  _getListView(BuildContext context) => MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(children: <Widget>[
        _getBanner(),
        _getLocalNav(),
        _getGridNav(),
        _getSubNav(),
        _getSalesBox()
      ]));

  _getBanner() => Container(
        height: 160,
        child: Swiper(
            itemCount: _homeModel.bannerList.length,
            autoplay: true,
            pagination: SwiperPagination(),
            itemBuilder: (context, index) {
              return Image(
                image: NetworkImage(_homeModel.bannerList[index].icon),
                fit: BoxFit.fitWidth,
              );
            }),
      );

  _getLocalNav() => Padding(
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
        child: LocalNavWidget(_homeModel.localNavList),
      );

  _getGridNav() => Padding(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 0),
      child: GridNavWidget(_homeModel.gridNav.hotel, _homeModel.gridNav.flight,
          _homeModel.gridNav.travel));

  _getSubNav() => Padding(
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
        child: SubNav(_homeModel.subNavList),
      );

  _getSalesBox() => Padding(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 8),
      child: SalesBoxWidget(_homeModel.salesBox));
}

import 'package:flutter/material.dart';
import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/pages/tab_bar_view_item.dart';
import 'package:trip_app/precenter/base_precenter.dart';
import 'package:trip_app/precenter/travel_pager_precenter.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends BaseState<TripModel>
    with TickerProviderStateMixin {
  TripModel _tripModel;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  IBasePrecenter getPrecenter() => TravelPagePrecenter(this);

  @override
  Widget getSuccesfulWidget() => Column(
        children: <Widget>[
          SizedBox(
              height: 70,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.blue,
                tabs: _getTabs(),
                controller: _tabController,
              )),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _getTabViewItems(),
            ),
          ),
        ],
      );

  @override
  void loadSuccessful(TripModel value) {
    super.loadSuccessful(value);
    setState(() {
      _tripModel = value;
      _tabController = _getTabController();
    });
  }

  List<Tab> _getTabs() {
    return _tripModel.tabs.map((tab) => Tab(text: tab.labelName)).toList();
  }

  TabController _getTabController() {
    TabController tabController =
        TabController(length: _tripModel.tabs.length, vsync: this);
    return tabController;
  }

  List<TabViewItem> _getTabViewItems() {
    var list = <TabViewItem>[];

    var tabs = _tripModel.tabs;

    for (var tab in tabs) {
      TabViewItem tabViewItem =
          TabViewItem(_tripModel.url, _tripModel.params, tab.groupChannelCode);
      list.add(tabViewItem);
    }
    return list;
  }
}

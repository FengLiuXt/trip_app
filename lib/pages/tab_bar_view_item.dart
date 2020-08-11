import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/model/trip_page_tab_view_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/precenter/base_precenter.dart';
import 'package:trip_app/precenter/travel_page_tab_view_precenter.dart';
import 'package:trip_app/widget/webview_widget.dart';

class TabViewItem extends StatefulWidget {
  String test = "test";
  String _url;
  Params _params;
  String _groupChannelCode;

  TabViewItem(this._url, this._params, this._groupChannelCode);

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends BaseState<TravelItemModel>
    implements ITravelPageTabViewPrecenter<TravelItemModel> {
  List<TravelItem> _lists;
  ScrollController _scrollController;
  TravelPageTabViewPrecenter _precenter;

  //加载更多
  bool _isLoadMore = false;
  LoadMoreState _loadMoreState;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _isLoadMore = true;
        _precenter.loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  IBasePrecenter getPrecenter() {
    TabViewItem w = widget as TabViewItem;
    _precenter = TravelPageTabViewPrecenter(
        this, this, w._url, w._params, w._groupChannelCode);
    return _precenter;
  }

  @override
  Widget getSuccesfulWidget() {
    if (_isLoadMore) {
      switch (_loadMoreState) {
        case LoadMoreState.LOADMORESUCCESSFUL:
          return _getMainWidget();

        case LoadMoreState.LOADINGMORE:
          return Column(
            children: <Widget>[
              _getMainWidget(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("正在加载......")),
            ],
          );

        case LoadMoreState.LOADMORERROR:
          return Column(
            children: <Widget>[_getMainWidget(), Text("加载错误，请稍后重试")],
          );

        case LoadMoreState.LOADMOREEMPTY:
          return Column(
            children: <Widget>[_getMainWidget(), Text("已经是全部了")],
          );
      }
    } else {
      return _getMainWidget();
    }
  }

  _getMainWidget() => Container(
        constraints: BoxConstraints(),
        child: StaggeredGridView.countBuilder(
            shrinkWrap: true,
            itemCount: _lists.length,
            crossAxisCount: 4,
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            itemBuilder: (context, index) => _getCardItem(context, index),
            staggeredTileBuilder: (index) => new StaggeredTile.fit(2)),
      );

  /////////////////////////////////////////////////////////////////////////////////////
  @override
  void loadSuccessful(TravelItemModel value) {
    super.loadSuccessful(value);

    setState(() {
      _lists = value.resultList;
    });
  }

  /**
   *  以下四个是上拉加载需要实现的方法
   */

  @override
  void loadMoreError() {
    setState(() {
      _loadMoreState = LoadMoreState.LOADMORERROR;
    });
  }

  @override
  void loadMoreSuccessful(TravelItemModel value) {
    setState(() {
      _loadMoreState = LoadMoreState.LOADMORESUCCESSFUL;
      _lists.addAll(value.resultList);
    });
  }

  @override
  void loading() {
    setState(() {
      _loadMoreState = LoadMoreState.LOADINGMORE;
    });
  }

  @override
  void loadEmpty() {
    setState(() {
      _loadMoreState = LoadMoreState.LOADMOREEMPTY;
    });
  }

//////////////////////////////////////////////////////////////////////////////////

  /**
   * item视图
   */
  _getCardItem(BuildContext context, int index) => GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WebViewWidget(_lists[index].article.urls[0].h5Url))),
      child: Card(
        child: Column(
          children: <Widget>[
            _getTopWidget(index),
            _getContentWidget(index),
            _getLikesWidget(index),
            _getAuthorWidget(index)
          ],
        ),
      ));

  /////////////////////////////////////////////////////////////////////////////////////////

  //景点图片描述
  _getTopWidget(int index) =>
      Stack(alignment: Alignment.bottomLeft, children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: FadeInImage.memoryNetwork(
                alignment: Alignment.topLeft,
                placeholder: kTransparentImage,
                image: _lists[index]?.article?.images[0]?.originalUrl,
                fit: BoxFit.fitWidth,
              )),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black26),
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.white),
              Expanded(
                  child: Text(
                _lists[index]?.article?.pois[0]?.poiName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              )),
            ],
          ),
        )
      ]);

  //景点描述
  _getContentWidget(int index) => Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        _lists[index]?.article?.articleTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ));

  //喜欢人数
  _getLikesWidget(int index) => Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            color: Colors.deepOrange,
            size: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(_lists[index]?.article?.likeCount?.toString()),
          )
        ],
      ));

  //分享者
  _getAuthorWidget(int index) => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
                child: ClipOval(
                    child: Image(
                        height: 20,
                        width: 20,
                        image: NetworkImage(_lists[index]
                            ?.article
                            ?.author
                            ?.coverImage
                            ?.originalUrl)))),
          ),
          Text(
            _lists[index]?.article?.author?.nickName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
}

enum LoadMoreState {
  LOADMORESUCCESSFUL,
  LOADINGMORE,
  LOADMORERROR,
  LOADMOREEMPTY
}

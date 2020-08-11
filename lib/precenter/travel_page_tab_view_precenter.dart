import 'dart:convert';
import 'dart:io';

import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/model/trip_page_tab_view_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/precenter/base_precenter.dart';

class TravelPageTabViewPrecenter extends IBasePrecenter {
  final _TRAVEL_URL =
      'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

  BaseState _baseState;
  String _url;
  Params _params;
  String _groupChannelCode;
  int _pageIndex;

  bool isLoadMore = false;

  ITravelPageTabViewPrecenter _iTravelPageTabViewPrecenter;

  TravelPageTabViewPrecenter(this._iTravelPageTabViewPrecenter, this._baseState,
      this._url, this._params, this._groupChannelCode);

  @override
  void loadContent() {
    _pageIndex = _params.pagePara.pageIndex;

    _post().then((value) {
      if (value.statusCode == 200) {
        value.transform(utf8.decoder).join().then((value) {
          JsonCodec json = JsonCodec();
          _baseState
              .loadSuccessful(TravelItemModel.fromJson(json.decode(value)));
        });
      } else {
        _baseState.loadingState = LoadingState.LOADERROR;
      }
    });
  }

  void loadMore() {
    _pageIndex++;
    _params.pagePara.pageIndex = _pageIndex;
    _iTravelPageTabViewPrecenter.loading();
    _post().then((value) {
      if (value.statusCode == 200) {
        value.transform(utf8.decoder).join().then((value) {
          JsonCodec json = JsonCodec();

          TravelItemModel travelItemModel =
              TravelItemModel.fromJson(json.decode(value));
//          if (travelItemModel.resultList.length == 0)
//            _iTravelPageTabViewPrecenter.loadEmpty();
//          else
          _iTravelPageTabViewPrecenter.loadMoreSuccessful(travelItemModel);
        });
      } else {
        _iTravelPageTabViewPrecenter.loadMoreError();
      }
    });
  }

  Future<HttpClientResponse> _post() async {
    var url = _url ?? _TRAVEL_URL;

    var params = _params.toJson();
    params["groupChannelCode"] = _groupChannelCode;
    var httpClient = HttpClient();
    var request = await httpClient.postUrl(Uri.parse(url));
    request.add(utf8.encode(json.encode(params)));
    return await request.close();
  }
}

abstract class ITravelPageTabViewPrecenter<T> {
  void loadMoreSuccessful(T value);
  void loadMoreError();
  void loading();
  void loadEmpty();
}

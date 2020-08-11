import 'dart:convert';
import 'dart:io';

import 'package:trip_app/model/home_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/precenter/base_precenter.dart';

class HomePagePrecenter extends IBasePrecenter {
  BaseState _baseState;

  HomePagePrecenter(this._baseState);

  @override
  void loadContent({Map<String, dynamic> params}) {
    _get().then((value) {
      if (value.statusCode == 200) {
        value.transform(utf8.decoder).join().then((value) {
          JsonCodec json = JsonCodec();
          _baseState.loadSuccessful(HomeModel.fromJson(json.decode(value)));
        });
      } else {
        _baseState.loadingState = LoadingState.LOADERROR;
      }
    });
  }
}

Future<HttpClientResponse> _get() async {
  var httpClient = new HttpClient();
  var uri =
      new Uri.http('www.devio.org', "/io/flutter_app/json/home_page.json");
  var request = await httpClient.getUrl(uri);
  return await request.close();
}

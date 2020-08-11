import 'dart:convert';
import 'dart:io';

import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/pages/base_page.dart';
import 'package:trip_app/precenter/base_precenter.dart';

class TravelPagePrecenter extends IBasePrecenter {
  BaseState _baseState;

  TravelPagePrecenter(this._baseState);

  @override
  void loadContent() {
    _get().then((value) {
      if (value.statusCode == 200) {
        value.transform(utf8.decoder).join().then((value) {
          JsonCodec json = JsonCodec();
          _baseState.loadSuccessful(TripModel.fromJson(json.decode(value)));
        });
      } else {
        _baseState.loadingState = LoadingState.LOADERROR;
      }
    });
  }

  Future<HttpClientResponse> _get() async {
    var httpClient = HttpClient();
    var url =
        Uri.parse("http://www.devio.org/io/flutter_app/json/travel_page.json");

    var request = await httpClient.getUrl(url);
    return await request.close();
  }
}

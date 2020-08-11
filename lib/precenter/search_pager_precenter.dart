import 'dart:convert';
import 'dart:io';

class SearchPagePrecenter {
  ISearchPagePrecenter _iSearchPagePrecenter;

  SearchPagePrecenter(this._iSearchPagePrecenter);

  getSearchContent() {
    _iSearchPagePrecenter.loadding();

    _get().then((value) {
      if (value.statusCode == 200) {
        value.transform(utf8.decoder).join().then((value) {
          _iSearchPagePrecenter.loadSuccessful(json.decode(value));
        });
      } else {
        _iSearchPagePrecenter.loadError();
      }
    });
  }

  Future<HttpClientResponse> _get() async {}
}

abstract class ISearchPagePrecenter {
  void loadding();
  void loadSuccessful(String searchContent);
  void loadError();
}

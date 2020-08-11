class TripModel {
  String _url;
  Params _params;
  List<Tabs> _tabs;

  TripModel({String url, Params params, List<Tabs> tabs}) {
    this._url = url;
    this._params = params;
    this._tabs = tabs;
  }

  String get url => _url;
  set url(String url) => _url = url;
  Params get params => _params;
  set params(Params params) => _params = params;
  List<Tabs> get tabs => _tabs;
  set tabs(List<Tabs> tabs) => _tabs = tabs;

  TripModel.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
    if (json['tabs'] != null) {
      _tabs = new List<Tabs>();
      json['tabs'].forEach((v) {
        _tabs.add(new Tabs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    if (this._params != null) {
      data['params'] = this._params.toJson();
    }
    if (this._tabs != null) {
      data['tabs'] = this._tabs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Params {
  int _districtId;
  String _groupChannelCode;
  Null _type;
  int _lat;
  int _lon;
  int _locatedDistrictId;
  PagePara _pagePara;
  int _imageCutType;
  Head _head;
  String _contentType;

  Params(
      {int districtId,
      String groupChannelCode,
      Null type,
      int lat,
      int lon,
      int locatedDistrictId,
      PagePara pagePara,
      int imageCutType,
      Head head,
      String contentType}) {
    this._districtId = districtId;
    this._groupChannelCode = groupChannelCode;
    this._type = type;
    this._lat = lat;
    this._lon = lon;
    this._locatedDistrictId = locatedDistrictId;
    this._pagePara = pagePara;
    this._imageCutType = imageCutType;
    this._head = head;
    this._contentType = contentType;
  }

  int get districtId => _districtId;
  set districtId(int districtId) => _districtId = districtId;
  String get groupChannelCode => _groupChannelCode;
  set groupChannelCode(String groupChannelCode) =>
      _groupChannelCode = groupChannelCode;
  Null get type => _type;
  set type(Null type) => _type = type;
  int get lat => _lat;
  set lat(int lat) => _lat = lat;
  int get lon => _lon;
  set lon(int lon) => _lon = lon;
  int get locatedDistrictId => _locatedDistrictId;
  set locatedDistrictId(int locatedDistrictId) =>
      _locatedDistrictId = locatedDistrictId;
  PagePara get pagePara => _pagePara;
  set pagePara(PagePara pagePara) => _pagePara = pagePara;
  int get imageCutType => _imageCutType;
  set imageCutType(int imageCutType) => _imageCutType = imageCutType;
  Head get head => _head;
  set head(Head head) => _head = head;
  String get contentType => _contentType;
  set contentType(String contentType) => _contentType = contentType;

  Params.fromJson(Map<String, dynamic> json) {
    _districtId = json['districtId'];
    _groupChannelCode = json['groupChannelCode'];
    _type = json['type'];
    _lat = json['lat'];
    _lon = json['lon'];
    _locatedDistrictId = json['locatedDistrictId'];
    _pagePara = json['pagePara'] != null
        ? new PagePara.fromJson(json['pagePara'])
        : null;
    _imageCutType = json['imageCutType'];
    _head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    _contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtId'] = this._districtId;
    data['groupChannelCode'] = this._groupChannelCode;
    data['type'] = this._type;
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['locatedDistrictId'] = this._locatedDistrictId;
    if (this._pagePara != null) {
      data['pagePara'] = this._pagePara.toJson();
    }
    data['imageCutType'] = this._imageCutType;
    if (this._head != null) {
      data['head'] = this._head.toJson();
    }
    data['contentType'] = this._contentType;
    return data;
  }
}

class PagePara {
  int _pageIndex;
  int _pageSize;
  int _sortType;
  int _sortDirection;

  PagePara({int pageIndex, int pageSize, int sortType, int sortDirection}) {
    this._pageIndex = pageIndex;
    this._pageSize = pageSize;
    this._sortType = sortType;
    this._sortDirection = sortDirection;
  }

  int get pageIndex => _pageIndex;
  set pageIndex(int pageIndex) => _pageIndex = pageIndex;
  int get pageSize => _pageSize;
  set pageSize(int pageSize) => _pageSize = pageSize;
  int get sortType => _sortType;
  set sortType(int sortType) => _sortType = sortType;
  int get sortDirection => _sortDirection;
  set sortDirection(int sortDirection) => _sortDirection = sortDirection;

  PagePara.fromJson(Map<String, dynamic> json) {
    _pageIndex = json['pageIndex'];
    _pageSize = json['pageSize'];
    _sortType = json['sortType'];
    _sortDirection = json['sortDirection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this._pageIndex;
    data['pageSize'] = this._pageSize;
    data['sortType'] = this._sortType;
    data['sortDirection'] = this._sortDirection;
    return data;
  }
}

class Head {
  String _cid;
  String _ctok;
  String _cver;
  String _lang;
  String _sid;
  String _syscode;
  Null _auth;
  List<Extension> _extension;

  Head(
      {String cid,
      String ctok,
      String cver,
      String lang,
      String sid,
      String syscode,
      Null auth,
      List<Extension> extension}) {
    this._cid = cid;
    this._ctok = ctok;
    this._cver = cver;
    this._lang = lang;
    this._sid = sid;
    this._syscode = syscode;
    this._auth = auth;
    this._extension = extension;
  }

  String get cid => _cid;
  set cid(String cid) => _cid = cid;
  String get ctok => _ctok;
  set ctok(String ctok) => _ctok = ctok;
  String get cver => _cver;
  set cver(String cver) => _cver = cver;
  String get lang => _lang;
  set lang(String lang) => _lang = lang;
  String get sid => _sid;
  set sid(String sid) => _sid = sid;
  String get syscode => _syscode;
  set syscode(String syscode) => _syscode = syscode;
  Null get auth => _auth;
  set auth(Null auth) => _auth = auth;
  List<Extension> get extension => _extension;
  set extension(List<Extension> extension) => _extension = extension;

  Head.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _ctok = json['ctok'];
    _cver = json['cver'];
    _lang = json['lang'];
    _sid = json['sid'];
    _syscode = json['syscode'];
    _auth = json['auth'];
    if (json['extension'] != null) {
      _extension = new List<Extension>();
      json['extension'].forEach((v) {
        _extension.add(new Extension.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this._cid;
    data['ctok'] = this._ctok;
    data['cver'] = this._cver;
    data['lang'] = this._lang;
    data['sid'] = this._sid;
    data['syscode'] = this._syscode;
    data['auth'] = this._auth;
    if (this._extension != null) {
      data['extension'] = this._extension.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extension {
  String _name;
  String _value;

  Extension({String name, String value}) {
    this._name = name;
    this._value = value;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get value => _value;
  set value(String value) => _value = value;

  Extension.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['value'] = this._value;
    return data;
  }
}

class Tabs {
  String _labelName;
  String _groupChannelCode;

  Tabs({String labelName, String groupChannelCode}) {
    this._labelName = labelName;
    this._groupChannelCode = groupChannelCode;
  }

  String get labelName => _labelName;
  set labelName(String labelName) => _labelName = labelName;
  String get groupChannelCode => _groupChannelCode;
  set groupChannelCode(String groupChannelCode) =>
      _groupChannelCode = groupChannelCode;

  Tabs.fromJson(Map<String, dynamic> json) {
    _labelName = json['labelName'];
    _groupChannelCode = json['groupChannelCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labelName'] = this._labelName;
    data['groupChannelCode'] = this._groupChannelCode;
    return data;
  }
}

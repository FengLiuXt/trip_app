import 'package:flutter/material.dart';
import 'package:trip_app/precenter/base_precenter.dart';

abstract class BaseState<T> extends State
    with AutomaticKeepAliveClientMixin
    implements IPrecenter<T> {
  LoadingState _loadingState = LoadingState.LOADING;
  IBasePrecenter _iBasePrecenter;

  set loadingState(LoadingState value) {
    setState(() {
      _loadingState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    switch (_loadingState) {
      case LoadingState.LOADING:
        return Center(child: CircularProgressIndicator());
      case LoadingState.LOADERROR:
        return Center(child: Text("加载错误"));
      case LoadingState.LOADSUCCESSFULL:
        return getSuccesfulWidget();
    }
  }

  @override
  void initState() {
    _iBasePrecenter = getPrecenter();

    if (_iBasePrecenter != null) _iBasePrecenter.loadContent();
  }

  Widget getSuccesfulWidget();
  IBasePrecenter getPrecenter();

  @override
  void loadSuccessful(T value) {
    _loadingState = LoadingState.LOADSUCCESSFULL;
  }

  @override
  bool get wantKeepAlive => true;
}

enum LoadingState { LOADING, LOADSUCCESSFULL, LOADERROR }

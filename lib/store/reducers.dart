import 'package:redux/redux.dart';
import 'package:flutter/cupertino.dart';
import '../utils/theme.dart';

import '../screen/account/redux/reducer.dart';

import './themeData/reducer.dart';

final reducers = combineReducers<StoreState>([
  accountReducer,
  themeReducer,
]);

class StoreState {
  String accessToken;

  // User userInfo;
  CupertinoThemeData themeData;
  Locale locale;

  StoreState({this.accessToken, this.themeData});

  factory StoreState.initial() {
    return StoreState(
      accessToken: '',
      themeData: dark,
    );
  }
}

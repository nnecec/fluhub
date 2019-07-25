import 'package:redux/redux.dart';

import '../screen/Account/redux/reducer.dart';
import '../screen/Home/redux/action.dart';
import '../screen/Trending/redux/action.dart';

final reducers = combineReducers<StoreState>([
  accountReducer,
  homeReducer,
  searchReducer,
]);

class StoreState {
  int counter;
  int count;
  String accessToken;

  StoreState({this.counter, this.count, this.accessToken});

  factory StoreState.initial() {
    return StoreState(
      counter: 0,
      count: 0,
      accessToken: '',
    );
  }
}

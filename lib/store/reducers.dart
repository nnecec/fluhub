import 'package:redux/redux.dart';

import '../screen/Home/redux/action.dart';
import '../screen/Search/redux/action.dart';

final reducers = combineReducers<StoreState>([
  homeReducer,
  searchReducer,
]);

class StoreState {
  int counter;
  int count;
  StoreState({this.counter, this.count});

  factory StoreState.initial() {
    return StoreState(counter: 0, count: 0);
  }
}

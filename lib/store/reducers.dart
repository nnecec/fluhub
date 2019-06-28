import 'package:redux/redux.dart';

import '../screen/home/redux/action.dart';

final reducers = combineReducers<StoreState>([
  homeReducer,
]);

class StoreState {
  int counter;
  StoreState({this.counter});

  factory StoreState.initial() {
    return StoreState(counter: 0);
  }
}

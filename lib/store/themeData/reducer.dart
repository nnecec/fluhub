import './action.dart';
import '../reducers.dart';

StoreState themeReducer(state, dynamic action) {
  if (action is CustomThemeData) {
    state.themeData = action.themeData;
  }
  return state;
}

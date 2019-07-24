import 'package:redux/redux.dart';
import './action.dart';
import '../../../store/reducers.dart';

StoreState accountReducer(state, dynamic action) {
  if (action is SetAccessTokenAction) {
    state.accessToken = action.accessToken;
  }
  return state;
}

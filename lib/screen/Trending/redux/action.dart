import '../../../store/reducers.dart';

enum SearchActions { Increment, Decrement }

StoreState searchReducer(state, dynamic action) {
  if (action == SearchActions.Increment) {
    state.count = state.count + 1;
  }
  if (action == SearchActions.Decrement) {
    state.count = state.count - 1;
  }

  return state;
}

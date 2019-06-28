import '../../../store/reducers.dart';

enum Actions { Increment, Decrement }

StoreState searchReducer(state, dynamic action) {
  if (action == Actions.Increment) {
    state.count = state.count + 1;
  }
  if (action == Actions.Decrement) {
    state.count = state.count - 1;
  }

  return state;
}

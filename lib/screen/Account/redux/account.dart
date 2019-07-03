import '../../../store/reducers.dart';

enum Actions { Increment, Decrement }

StoreState accountReducer(state, dynamic action) {
  if (action == Actions.Increment) {
    state.counter = state.counter + 1;
  }
  if (action == Actions.Decrement) {
    state.counter = state.counter - 1;
  }

  return state;
}

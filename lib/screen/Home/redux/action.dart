import '../../../store/reducers.dart';

enum HomeActions { Increment, Decrement }

StoreState homeReducer(state, dynamic action) {
  if (action == HomeActions.Increment) {
    state.counter = state.counter + 1;
  }
  if (action == HomeActions.Decrement) {
    state.counter = state.counter - 1;
  }

  return state;
}

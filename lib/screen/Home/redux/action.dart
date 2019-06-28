import '../../../store/reducers.dart';

enum Actions { Increment, Decrement }

StoreState homeReducer(state, dynamic action) {
  if (action == 'Actions.Increment') {
    return StoreState(counter: state.counter + 1);
  }
  if (action == 'Actions.Decrement') {
    return StoreState(counter: state.counter - 1);
  }

  return state;
}

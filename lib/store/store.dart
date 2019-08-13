import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';

import './reducers.dart';

final store = Store<StoreState>(
  reducers,
  middleware: [],
  initialState: StoreState.initial(),
);

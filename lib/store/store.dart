import 'package:redux/redux.dart';

import './reducers.dart';

final store = Store<StoreState>(
  reducers,
  initialState: StoreState.initial(),
);

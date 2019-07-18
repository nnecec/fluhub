import 'package:fluhub/store/reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/action.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            StoreConnector<StoreState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, counter) => Text(counter),
            ),
            StoreConnector<StoreState, VoidCallback>(
              converter: (store) => () => store.dispatch(HomeActions.Increment),
              builder: (context, callback) => CupertinoButton(
                onPressed: callback,
                child: Text('Increment'),
              ),
            ),
            StoreConnector<StoreState, VoidCallback>(
              converter: (store) => () => store.dispatch(HomeActions.Decrement),
              builder: (context, callback) => CupertinoButton(
                onPressed: callback,
                child: Text('Decrement'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

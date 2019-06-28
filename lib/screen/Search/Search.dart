import 'package:fluhub/store/reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/action.dart';

class Search extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            StoreConnector<StoreState, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, count) => Text(count),
            ),
            StoreConnector<StoreState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(Actions.Increment);
              },
              builder: (context, callback) => CupertinoButton(
                    onPressed: callback,
                    child: Text('Increment'),
                  ),
            ),
            StoreConnector<StoreState, VoidCallback>(
              converter: (store) => () => store.dispatch(Actions.Decrement),
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

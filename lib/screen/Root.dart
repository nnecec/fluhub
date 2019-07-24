import 'package:fluhub/store/reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../routes.dart';
import '../config/constant.dart';
import '../utils/storage.dart';
import './Account/redux/action.dart';
import '../store/store.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<Root> {
  List<BottomNavigationBarItem> _buildTabBarItems() {
    return tabList
        .map((tab) => BottomNavigationBarItem(
              icon: tab['icon'],
              title: tab['title'],
            ))
        .toList();
  }

  handleTap(value, context) {
    final widget = tabList[value]['widget'];
    return widget(context);
  }

  Widget _renderTabsViewer(context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return handleTap(index, context);
          },
        );
      },
    );
  }

  Future _getToken(context) async {
    // final access_token = await LocalStorage.getItem(Constant.TOKEN);
    final access_token = await LocalStorage.getItem(Constant.TOKEN);

    return access_token;
  }

  Widget _renderLogin(context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('使用 GitHub 登录'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pushNamed('/login');
          },
        ),
      ),
    );
  }

  Widget _renderRoot() {
    return StoreConnector<StoreState, String>(
      converter: (store) => store.state.accessToken,
      builder: (BuildContext context, String accessToken) {
        if (accessToken.length > 0) {
          return _renderTabsViewer(context);
        } else {
          return _renderLogin(context);
        }
      },
    );
  }

  Widget build(BuildContext rootContext) {
    return FutureBuilder(
      future: _getToken(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Loading...');
          case ConnectionState.done:
            print(snapshot.data);
            if (snapshot.hasData) {
              store.dispatch(SetAccessTokenAction(snapshot.data));
            }
            return _renderRoot();
          default:
            return _renderRoot();
        }
      },
    );
  }
}

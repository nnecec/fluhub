import 'package:fluhub/store/reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../routes.dart';
import '../config/constant.dart';
import '../utils/storage.dart';
import './account/redux/action.dart';
import '../store/store.dart';
import '../screen/account/login_screen.dart';

// bloc
import './home/bloc/bloc.dart';
import './user/bloc/bloc.dart';

class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  int currentTab = 0;
  final CupertinoTabController _tabController =
      CupertinoTabController(initialIndex: 0);

  List<BottomNavigationBarItem> _buildTabBarItems() {
    return tabList
        .map((tab) => BottomNavigationBarItem(
              icon: tab['icon'],
              title: tab['title'],
            ))
        .toList();
  }

  void handleTap(value) {
    setState(() {
      currentTab = value;
    });
    _tabController.index = value;
  }

  Widget renderTabView() {
    final widget = tabList[currentTab]['widget'];

    return CupertinoTabView(
      builder: (BuildContext context) {
        return MultiBlocProvider(providers: [
          BlocProvider<HomeBloc>(
            builder: (BuildContext context) => HomeBloc(),
          ),
          BlocProvider<UserBloc>(
            builder: (BuildContext context) => UserBloc(),
          ),
        ], child: widget(context));
      },
    );
  }

  Widget _renderTabsViewer(context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
        onTap: handleTap,
      ),
      controller: _tabController,
      tabBuilder: (BuildContext context, int index) {
        return renderTabView();
      },
    );
  }

  Future _getToken() async {
    final String access_token = await LocalStorage.getItem(Constant.TOKEN);
    return access_token;
  }

  Widget _renderLogin() {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('使用 GitHub 登录'),
          onPressed: () async {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoPopupSurface(
                  child: LoginScreen(context),
                );
              },
            );
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
          return _renderLogin();
        }
      },
    );
  }

  Widget build(BuildContext rootContext) {
    return FutureBuilder(
      future: _getToken(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // 
          if (snapshot.hasData && store.state.accessToken.isEmpty) {
            store.dispatch(SetAccessTokenAction(snapshot.data));
          }
        }
        return _renderRoot();
      },
    );
  }
}

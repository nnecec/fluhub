import 'package:flutter/cupertino.dart';
import '../routes.dart';

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

  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          routes: routes,
          builder: (BuildContext context) {
            return handleTap(index, context);
          },
        );
      },
    );
  }
}

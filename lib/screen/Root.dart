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

  Widget build(BuildContext rootContext) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _buildTabBarItems(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return handleTap(index, rootContext);
          },
        );
      },
    );
  }
}

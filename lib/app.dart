import 'package:flutter/material.dart';

import './routes.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluHub',
      // routes: routes,
      home: Scaffold(
        body: Center(
          child: Text('You have pressed the button times.'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              title: Text('Trending'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Me'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
        ),
      ),
    );
  }
}

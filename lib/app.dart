import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './routes/routes.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> with TickerProviderStateMixin {
  List tabList = [
    {'text': 'Home', 'path': '/home'},
    {'text': 'Trending', 'path': '/trending'},
    {'text': 'Search', 'path': '/search'},
    {'text': 'Me', 'path': '/me'},
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabList.length, vsync: this);
  }

  // AppState() {
  //   final router = Router();
  //   Routes.configureRoutes(router);
  //   Application.router = router;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluHub',
      // onGenerateRoute: Application.router.generator,
      home: Scaffold(
        appBar: AppBar(
          // title: Text('FluHub'),
          title: TabBar(
            controller: _tabController,
            // indicatorWeight: 2.0,
            indicatorColor: Colors.white,
            tabs: tabList.map((tab) {
              return Center(child: Text(tab['text']));
            }).toList(),
          ),
        ),
        body: Center(
          child: Text('You have pressed the button times.'),
        ),
      ),
    );
  }
}

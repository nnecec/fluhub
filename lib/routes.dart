import 'package:flutter/cupertino.dart';

import './screen/root_screen.dart';

import './screen/home/home_screen.dart';
import './screen/trending/trending_screen.dart';
import './screen/explore/explore_screen.dart';
import './screen/user/user_screen.dart';
import './screen/repository/repository_screen.dart';

final routes = {
  '/': (context) => RootScreen(),
  '/repository': (context) => RepositoryScreen(),
};

List tabList = [
  {
    'icon': Icon(CupertinoIcons.home),
    'title': Text('Home'),
    'widget': (context) => HomeScreen(),
  },
  {
    'icon': Icon(CupertinoIcons.shuffle),
    'title': Text('Trending'),
    'widget': (context) => TrendingScreen(),
  },
  {
    'icon': Icon(CupertinoIcons.search),
    'title': Text('Explore'),
    'widget': (context) => ExploreScreen()
  },
  {
    'icon': Icon(CupertinoIcons.person),
    'title': Text('Me'),
    'widget': (context) => UserScreen(),
  },
];

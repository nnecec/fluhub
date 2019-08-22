import 'package:flutter/cupertino.dart';

import './screen/Root.dart';
import './screen/Account/Login.dart';

import './screen/Home/Home.dart';
import './screen/Trending/Trending.dart';
import './screen/Explore/Explore.dart';
import './screen/Me/Me.dart';

final routes = {
  '/': (context) => Root(),
  // '/login': (context) => Login(context),
};

List tabList = [
  {
    'icon': Icon(CupertinoIcons.home),
    'title': Text('Home'),
    'widget': (context) => Home(),
  },
  {
    'icon': Icon(CupertinoIcons.shuffle),
    'title': Text('Trending'),
    'widget': (context) => Trending(),
  },
  {
    'icon': Icon(CupertinoIcons.search),
    'title': Text('Explore'),
    'widget': (context) => Explore()
  },
  {
    'icon': Icon(CupertinoIcons.person),
    'title': Text('Me'),
    'widget': (context) => Me(),
  },
];

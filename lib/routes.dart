import 'package:flutter/material.dart';

import './screen/Root.dart';
import './screen/Account/Login.dart';

import './screen/Home/Home.dart';
import './screen/Trending/Trending.dart';
import './screen/Explore/Explore.dart';
import './screen/Me/Me.dart';

final routes = {
  '/': (context) => Root(),
  '/login': (context) => Login(context),
};

List tabList = [
  {
    'icon': Icon(Icons.home),
    'title': Text('Home'),
    'widget': (context) => Home(),
  },
  {
    'icon': Icon(Icons.trending_up),
    'title': Text('Trending'),
    'widget': (context) => Trending(),
  },
  {
    'icon': Icon(Icons.explore),
    'title': Text('Explore'),
    'widget': (context) => Explore()
  },
  {
    'icon': Icon(Icons.person),
    'title': Text('Me'),
    'widget': (context) => Me(),
  },
];

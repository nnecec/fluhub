import 'package:flutter/material.dart';

import './screen/Root.dart';
import './screen/Home.dart';
import './screen/Trending.dart';
import './screen/Search.dart';
import './screen/Me/Me.dart';

final routes = {
  '/': (context) => Root(),
  '/home': (context) => Home(),
  '/trending': (context) => Trending(),
  '/search': (context) => Search(),
  '/me': (context) => Me(),
};

List tabList = [
  {
    'icon': Icon(Icons.home),
    'title': Text('Home'),
    'widget': (context) => Home()
  },
  {
    'icon': Icon(Icons.trending_up),
    'title': Text('Trending'),
    'widget': (context) => Trending()
  },
  {
    'icon': Icon(Icons.search),
    'title': Text('Search'),
    'widget': (context) => Search(),
  },
  {
    'icon': Icon(Icons.person),
    'title': Text('Me'),
    'widget': (context) => Me(),
  },
];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screen/home/bloc/bloc.dart';

import './screen/Root.dart';
import './screen/Account/Login.dart';

import './screen/Home/Home.dart';
import './screen/Trending.dart';
import './screen/Search/Search.dart';
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

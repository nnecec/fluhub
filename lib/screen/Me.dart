import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

class Me extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Me'),
      ),
      child: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.amber[600],
            child: Center(child: Text('Entry A')),
            margin: EdgeInsets.only(bottom: 30.0),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: Center(child: Text('Entry C')),
          ),
        ],
      )),
    );
  }
}

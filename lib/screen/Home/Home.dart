import 'package:fluhub/store/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/action.dart';
import '../../utils/githubV3_client.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News'),
      ),
      child: SafeArea(
          child: FutureBuilder(
        future: v3.get('/users/nnecec/received_events'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[],
            );
          }
          return Text('loading...');
        },
      )),
    );
  }
}

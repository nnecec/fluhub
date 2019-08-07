import 'dart:convert';
import 'package:fluhub/store/reducers.dart';
import 'package:fluhub/widgets/repository_card.dart';
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

              final events = List.from(snapshot.data);
              return ListView(
                children: events.map((event) {
                  final repoNameArr = event['repo']['name'].split('/');
                  return RepositoryCard(repoNameArr[0], repoNameArr[1]);
                }).toList(),
              );
            }
            return Text('loading...');
          },
        ),
      ),
    );
  }
}

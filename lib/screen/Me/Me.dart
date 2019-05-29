import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './helper.dart';

class Me extends StatelessWidget {
  Widget queryUser() {
    return Query(
      options: QueryOptions(
        document: queryMe,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) {
          return Text(result.errors.toString());
        }
        if (result.loading) {
          return Center(child: CupertinoActivityIndicator());
        }
        final viewer = result.data['viewer'];
        return ListView(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.amber[600],
              child: Text(viewer['login']),
              margin: EdgeInsets.only(bottom: 30.0),
            ),
            Container(
              child: Text(viewer['email']),
            ),
            Container(
              child: Text(viewer['location']),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Me'),
      ),
      child: SafeArea(
        child: queryUser(),
      ),
    );
  }
}

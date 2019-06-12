import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:fluhub/widgets/ListItem.dart';
import 'package:fluhub/widgets/Card.dart';
import './helper.dart';
import './profileCard.dart';

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
        final Map viewer = result.data['viewer'];
        return ListView(
          children: [
            NCard(ProfileCard(viewer)),
            Column(children: [
              ListItem(
                name: 'Repositories',
                subtitle: viewer['repositories']['totalCount'].toString(),
              ),
              ListItem(
                name: 'Stars',
                subtitle:
                    viewer['starredRepositories']['totalCount'].toString(),
              ),
              ListItem(
                name: 'Followers',
                subtitle: viewer['followers']['totalCount'].toString(),
              ),
              ListItem(
                name: 'Following',
                subtitle: viewer['following']['totalCount'].toString(),
              ),
            ])
          ],
        );
      },
    );
  }

  Widget _renderAccount(context) => Container(
        child: CupertinoButton(
          color: CupertinoColors.extraLightBackgroundGray,
          child: Text('使用 GitHub 登录'),
          onPressed: () => {Navigator.pushNamed(context, '/login')},
        ),
      );

  Widget _renderUser(context) {
    if (true) {
      return _renderAccount(context);
    }
    return queryUser();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Me'),
      ),
      child: SafeArea(
        child: _renderUser(context),
      ),
    );
  }
}

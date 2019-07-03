import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../widgets/ListItem.dart';
import '../../widgets/Card.dart';
import './helper.dart';
import './profileCard.dart';
import '../../config/constant.dart';
import '../../utils/storage.dart';

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
          onPressed: () {
            print(context);
            Navigator.of(context, rootNavigator: true).pushNamed('/login');
          },
        ),
      );

  Future _getToken(context) async {
    final access_token = await LocalStorage.getItem(Constant.TOKEN);
    return access_token;
    // if (true) {
    //   return _renderAccount(context);
    // }
    // return queryUser();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Me'),
      ),
      child: SafeArea(
        // child: _renderUser(context),
        child: FutureBuilder(
          future: _getToken(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print(snapshot);
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text('Loading...');
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return Text('Result: ${snapshot.data}');
              default:
                return Text('initial');
            }
          },
        ),
      ),
    );
  }
}

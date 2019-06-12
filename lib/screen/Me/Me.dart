import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
        print(viewer);
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

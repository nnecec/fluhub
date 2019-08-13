import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../widgets/ListItem.dart';
import '../../widgets/wrapper_card.dart';
import './helper.dart';
import './profileCard.dart';
import '../../config/constant.dart';
import '../../utils/storage.dart';
import '../Account/redux/action.dart';
import '../../store/store.dart';

class Me extends StatelessWidget {
  Widget queryUser(context) {
    return Query(
      options: QueryOptions(
        document: queryMe,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) {
          // return _renderAccount(context);
        }
        if (result.loading) {
          return Center(child: CupertinoActivityIndicator());
        }
        final Map viewer = result.data['viewer'];
        return ListView(
          children: [
            WrapperCard(child: ProfileCard(viewer)),
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
              CupertinoButton(
                child: Text('Log out'),
                color: CupertinoColors.destructiveRed,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text('确认退出么？'),
                        message: Text('退出后需要重新登陆才可使用'),
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context, 'cancel logout');
                          },
                          child: Text("取消"),
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () async {
                              await LocalStorage.removeItem(Constant.TOKEN);
                              store.dispatch(SetAccessTokenAction(''));
                              Navigator.pop(context, 'confirm logout');
                            },
                            child: Text('确认'),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
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
            Navigator.of(context, rootNavigator: true).pushNamed('/login');
          },
        ),
      );

  Future _getToken(context) async {
    final access_token = await LocalStorage.getItem(Constant.TOKEN);
    return access_token;
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
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text('Loading...');
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return queryUser(context);
                }
                return _renderAccount(context);
              default:
                return _renderAccount(context);
            }
          },
        ),
      ),
    );
  }
}

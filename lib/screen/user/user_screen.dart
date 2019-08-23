import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../widgets/list_item.dart';
import '../../widgets/wrapper_card.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/contribution_card.dart';

import './helper.dart';
import '../../config/constant.dart';
import '../../utils/storage.dart';
import '../Account/redux/action.dart';
import '../../store/store.dart';

class UserScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Query(
      options: QueryOptions(
        document: queryUser,
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.errors != null) {
          // return _renderAccount(context);
        }
        if (result.loading) {
          return Center(child: CupertinoActivityIndicator());
        }
        final Map viewer = result.data['viewer'];
        return Container(
          color: CupertinoColors.extraLightBackgroundGray,
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text('Me'),
              ),
              SliverSafeArea(
                top: false,
                minimum: EdgeInsets.only(top: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Column(
                        children: [
                          WrapperCard(child: ProfileCard(viewer)),
                          WrapperCard(
                              child: ContributionCard(
                                  viewer['contributionsCollection']
                                      ['contributionCalendar'])),
                          WrapperCard(
                              child: Column(children: [
                            ListItem(
                              name: 'Repositories',
                              subtitle: viewer['repositories']['totalCount']
                                  .toString(),
                            ),
                            ListItem(
                              name: 'Stars',
                              subtitle: viewer['starredRepositories']
                                      ['totalCount']
                                  .toString(),
                            ),
                            ListItem(
                              name: 'Followers',
                              subtitle:
                                  viewer['followers']['totalCount'].toString(),
                            ),
                            ListItem(
                              name: 'Following',
                              subtitle:
                                  viewer['following']['totalCount'].toString(),
                              bordered: false,
                            )
                          ])),
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
                                          await LocalStorage.removeItem(
                                              Constant.TOKEN);
                                          store.dispatch(
                                              SetAccessTokenAction(''));
                                          Navigator.pop(
                                              context, 'confirm logout');
                                        },
                                        child: Text('确认'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

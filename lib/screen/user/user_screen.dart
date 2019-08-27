import 'package:fluhub/store/themeData/action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_item.dart';
import '../../widgets/wrapper_card.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/contribution_card.dart';

import '../../config/constant.dart';
import '../../utils/storage.dart';
import '../../utils/theme.dart';
import '../account/redux/action.dart';
import '../../store/store.dart';

import './bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => UserBloc(),
      child: UserBlocScreen(),
    );
  }
}

class UserBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.dispatch(GetUser(login: 'nnecec'));

    return CupertinoPageScaffold(
      child: Container(
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
                    return BlocBuilder<UserBloc, UserState>(
                      builder: (BuildContext context, UserState state) {
                        if (state is UserStateLoading) {
                          return Center(child: CupertinoActivityIndicator());
                        }
                        if (state is UserStateSuccess) {
                          final user = state.user;

                          return Column(
                            children: [
                              WrapperCard(child: ProfileCard(user)),
                              WrapperCard(
                                  child: ContributionCard(
                                      user['contributionsCollection']
                                          ['contributionCalendar'])),
                              WrapperCard(
                                child: Column(
                                  children: [
                                    ListItem(
                                      name: 'Repositories',
                                      subtitle: user['repositories']
                                              ['totalCount']
                                          .toString(),
                                    ),
                                    ListItem(
                                      name: 'Stars',
                                      subtitle: user['starredRepositories']
                                              ['totalCount']
                                          .toString(),
                                    ),
                                    ListItem(
                                      name: 'Followers',
                                      subtitle: user['followers']['totalCount']
                                          .toString(),
                                    ),
                                    ListItem(
                                      name: 'Following',
                                      subtitle: user['following']['totalCount']
                                          .toString(),
                                      bordered: false,
                                    )
                                  ],
                                ),
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
                                        cancelButton:
                                            CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(
                                                context, 'cancel logout');
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
                              ),
                              WrapperCard(
                                child: Column(
                                  children: [
                                    ListItem(
                                      name: 'Dark Mode',
                                      after: CupertinoSwitch(
                                        value: store.state.themeData == dark,
                                        onChanged: (bool value) {
                                          print(value);
                                          if (value == false) {
                                            store.dispatch(
                                                CustomThemeData(light));
                                          } else if (value == true) {
                                            store.dispatch(
                                                CustomThemeData(dark));
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(child: Text('Welcome to Me!'));
                      },
                    );
                  },
                  childCount: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

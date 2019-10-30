import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/list_card.dart';
import '../../widgets/wrapper_card.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/contribution_card.dart';


import '../../utils/theme.dart';

import '../../store/store.dart';
import '../../store/themeData/action.dart';

import './bloc/bloc.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context);

    return CupertinoPageScaffold(
      child: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Me'),
              trailing: CupertinoButton(
                child: Icon(CupertinoIcons.settings),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed('/settings');
                },
              ),
            ),
            SliverSafeArea(
              top: false,
              minimum: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BlocBuilder<UserBloc, UserState>(
                      builder: (BuildContext context, UserState state) {
                        if (state is UserStateEmpty) {
                          _userBloc.add(UserDetail(login: 'nnecec'));
                        }
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
                                padding: 2,
                                child: ListCard(
                                  data: [
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
                                    )
                                  ],
                                ),
                              ),
                              
                              WrapperCard(
                                child: Column(
                                  children: [
                                    ListItem(
                                      name: 'Dark Mode',
                                      after: CupertinoSwitch(
                                        value: store.state.themeData == dark,
                                        onChanged: (bool value) {
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

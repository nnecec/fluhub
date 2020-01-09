import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_card.dart';
import '../../config/constant.dart';
import '../../utils/storage.dart';
import '../account/redux/action.dart';
import '../../store/store.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Settings'),
            ),
            SliverSafeArea(
              top: false,
              minimum: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      children: [
                        ListCard(
                          data: [
                            ListItem(name: ''),
                            ListItem(name: 'Stars'),
                            ListItem(name: 'Followers'),
                            ListItem(name: 'Following')
                          ],
                        ),
                        ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: CupertinoButton(
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
                          ),
                        ),
                      ],
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

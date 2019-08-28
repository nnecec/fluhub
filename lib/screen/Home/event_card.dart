import 'package:flutter/cupertino.dart';
import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/wrapper_card.dart';

class EventCard extends StatelessWidget {
  dynamic user;
  String action;
  String title;
  EventCard(this.user, this.action, this.title) {}

  @override
  Widget build(BuildContext context) {
    var action = '';
    if (this.action == 'WatchEvent') {
      action = 'started';
    } else if (this.action == 'CreateEvent') {
      action = 'created';
    } else if (this.action == 'ForkEvent') {
      action = 'forked';
    }
    final repoNameArr = title.split('/');
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return WrapperCard(
      // margin: EdgeInsets.all(10.0),
      // padding: EdgeInsets.all(12.0),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 12.0,
          color: CupertinoColors.inactiveGray,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Text(
                    user['login'],
                    style: TextStyle(color: theme.primaryColor),
                  ),
                ),
                Text(action),
              ],
            ),
            // RepositoryCard(owner: repoNameArr[0], name: repoNameArr[1]),
          ],
        ),
      ),
    );
  }
}

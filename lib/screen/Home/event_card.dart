import 'package:flutter/cupertino.dart';
import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/wrapper_card.dart';

class EventCard extends StatelessWidget {
  final event;
  EventCard(this.event) {}

  String parseActionName() {
    final type = event['type'];
    var action = '';
    if (type == 'WatchEvent') {
      action = 'started';
    } else if (type == 'CreateEvent') {
      action = 'created';
    } else if (type == 'ForkEvent') {
      action = 'forked';
    }
    return action;
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);
    final action = parseActionName();
    final login = event['actor']['login'];
    final repository = event['repositoryDetail'];
    final repoName = event['repo']['name'];
    return WrapperCard(
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
                    login,
                    style: TextStyle(color: theme.primaryColor),
                  ),
                ),
                Text(action),
                CupertinoButton(
                  child: Text(repoName),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                      '/repository',
                      arguments: RepositoryArguments(repoName),
                    );
                  },
                ),
              ],
            ),
            if (repository != null)
              RepositoryCard(
                repository: repository['repository'],
                name: repoName,
              ),
          ],
        ),
      ),
    );
  }
}

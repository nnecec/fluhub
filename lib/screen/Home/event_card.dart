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
          color: CupertinoColors.inactiveGray,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(login),
                Container(
                  margin: EdgeInsets.only(right: 4.0, left: 4.0),
                  child: Text(action),
                ),
                Flexible(
                  child: GestureDetector(
                    child: Text(
                      repoName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: theme.primaryColor),
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        '/repository',
                        arguments: RepositoryArguments(repoName),
                      );
                    },
                  ),
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

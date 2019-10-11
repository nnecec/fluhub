import 'package:flutter/cupertino.dart';
import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/wrapper_card.dart';

class RepositoryInformation extends StatelessWidget {
  final repository;
  RepositoryInformation(this.repository) {}

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);
    print(repository);
    return WrapperCard(
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.inactiveGray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                '${repository['owner']['login']}/${repository['name']}',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            if (repository.containsKey('description'))
              Container(
                margin: EdgeInsets.all(8),
                child: Text(repository['description']),
              ),
            if (repository.containsKey('homepageUrl') &&
                repository['homepageUrl'] != null)
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  repository['homepageUrl'],
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${repository['watchers']['totalCount']}'),
                        Text('watchers'),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${repository['stargazers']['totalCount']}'),
                        Text('stars'),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${repository['forkCount']}'),
                        Text('forks'),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

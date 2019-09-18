import 'package:flutter/cupertino.dart';
import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/wrapper_card.dart';

class RepositoryInformation extends StatelessWidget {
  final repository;
  RepositoryInformation(this.repository) {}

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return WrapperCard(
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.inactiveGray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${repository['owner']['login']}/${repository['name']}'),
            if (repository['description'] != null)
              Text(repository['description']),
            Text('${repository['watchers']['totalCount']} watchers'),
            Text('${repository['stargazers']['totalCount']} stars'),
            Text('${repository['forkCount']} forks'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/wrapper_card.dart';

class RepositorySummary extends StatelessWidget {
  final repository;
  RepositorySummary(this.repository) {}

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
            Text('Commits'),
            Text('Branch'),
            Text('releases'),
            if (repository['license'] != null) Text(repository['license']),
            Text('Code'),
          ],
        ),
      ),
    );
  }
}

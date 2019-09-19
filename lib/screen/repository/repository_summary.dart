import 'package:flutter/cupertino.dart';

import 'package:fluhub/widgets/wrapper_card.dart';
import 'package:fluhub/widgets/list_card.dart';

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
        child: ListCard(
          data: [
            ListItem(
              name: 'Issues',
              subtitle: repository['issues']['totalCount'].toString(),
            ),
            ListItem(
              name: 'Pull requests',
              subtitle: repository['pullRequests']['totalCount'].toString(),
            ),
            ListItem(
              name: 'Releases',
              subtitle: repository['releases']['totalCount'].toString(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../utils/color.dart';

class RepositoryArguments {
  String name;
  RepositoryArguments(this.name);
}

class RepositoryCard extends StatelessWidget {
  final repository;
  final name;

  RepositoryCard({
    this.repository,
    this.name,
  }) {}

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    final repo = this.repository;
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          '/repository',
          arguments: RepositoryArguments(name),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 14.0,
            color: theme.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '${this.name}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              if (repo['description'] != null)
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(repo['description']),
                ),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12.0,
                  color: theme.primaryColor,
                ),
                child: Row(
                  children: <Widget>[
                    if (repo['primaryLanguage'] != null)
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8.0,
                            height: 8.0,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                color:
                                    HexColor(repo['primaryLanguage']['color']),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4.0, right: 8.0),
                            child: Text(repo['primaryLanguage']['name']),
                          )
                        ],
                      ),
                    Icon(
                      Icons.star,
                      color: theme.primaryColor,
                      size: 12.0,
                    ),
                    Text(repo['stargazers']['totalCount'].toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RepositoryCard extends StatelessWidget {
  String owner;
  String name;
  RepositoryCard(this.owner, this.name) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xF5F2F2F2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Query(
        options: QueryOptions(
          document: queryRepo,
          variables: {
            'owner': this.owner,
            'name': this.name,
          },
        ),
        builder: (QueryResult result, {VoidCallback refetch}) {
          if (result.errors != null) {}
          if (result.loading) {
            return Center(child: CupertinoActivityIndicator());
          }

          final repo = result.data['repository'];

          return Column(
            children: <Widget>[
              Text('${this.owner}/${this.name}'),
              if (repo['description'] != null) Text(repo['description']),
              Text(repo['updatedAt'])
            ],
          );
        },
      ),
    );
  }
}

final String queryRepo = '''
  query ReadRepositories(\$owner: String!, \$name: String!){
    repository(owner: \$owner, name: \$name) {
      primaryLanguage{
        color
        name
      }
      description
      stargazers{
        totalCount
      }
      updatedAt
    }
  }
''';

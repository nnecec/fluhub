final String repositoryDocument = '''
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
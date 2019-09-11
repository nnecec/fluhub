final String repositoryDocument = '''
  query ReadRepositories(\$owner: String!, \$name: String!){
    repository(owner: \$owner, name: \$name) {
      owner{
        login
      }
      name
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

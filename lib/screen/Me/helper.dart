final String queryMe = '''
  query {
    viewer {
      bio
      company
      email
      location
      login
      name
      status {
        emoji
        message
      }
      websiteUrl
    }
  }
''';

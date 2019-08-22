final String queryMe = '''
  query {
    viewer {
      avatarUrl
      bio
      company
      followers {
        totalCount
      }
      following {
        totalCount
      }
      location
      login
      name
      repositories {
        totalCount
      }
      status {
        emoji
        message
      }
      starredRepositories {
        totalCount
      }
      websiteUrl
      contributionsCollection{
        contributionCalendar{
          totalContributions
          weeks{
            contributionDays{
              date
              contributionCount
              color
            }
          }
        }
      }
    }
  }
''';

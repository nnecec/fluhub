final String repositoryDocument = '''
  query ReadRepositories(\$owner: String!, \$name: String!) {
    repository(owner: \$owner, name: \$name) {
      owner {
        login
      }
      name
      description
      issues(states: OPEN) {
        totalCount
      }
      pullRequests(states: OPEN) {
        totalCount
      }
      watchers {
        totalCount
      }
      stargazers {
        totalCount
      }
      forkCount
      defaultBranchRef {
        name
        target {
          ... on Commit {
            history {
              totalCount
            }
          }
        }
      }
      refs(first: 100, refPrefix: "refs/heads/") {
        nodes {
          name
        }
      }
      repositoryTopics(first: 100) {
        nodes {
          topic {
            name
          }
        }
      }
      licenseInfo {
        name
      }
    }
  }
''';

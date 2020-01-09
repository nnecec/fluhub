import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './bloc.dart';
import '../models/repository.dart';
import '../../../utils/graphql_client.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  @override
  RepositoryState get initialState => RepositoryStateEmpty();

  @override
  Stream<RepositoryState> mapEventToState(
    RepositoryEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is RepositoryDetail) {
      yield RepositoryStateLoading();

      try {
        final repoArr = event.name.split('/');

        final QueryResult detail = await githubClient.query(
          QueryOptions(
            documentNode: gql(repositoryDocument),
            variables: {
              'owner': repoArr[0],
              'name': repoArr[1],
            },
          ),
        );
        print(detail.data);
        final repository = detail.data;
        yield RepositoryStateSuccess(repository: repository);
      } catch (error) {
        yield RepositoryStateError(error);
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './bloc.dart';
import '../models/repository.dart';

import '../../../utils/graphql_client.dart';
import '../../../utils/githubV3_client.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeStateEmpty();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is EventsList) {
      yield HomeStateLoading();
      try {
        final List events = await v3.get('/users/nnecec/received_events');

        // for (var i = 0; i < events.length; i++) {
        //   final event = events[i];
        //   final repoArr = event['repo']['name'].split('/');
        //   final QueryResult repositoryDetail = await githubClient.query(
        //     QueryOptions(
        //       document: repositoryDocument,
        //       variables: {
        //         'owner': repoArr[0],
        //         'name': repoArr[1],
        //       },
        //     ),
        //   );
        //   print(repositoryDetail.data);
        //   event['repositoryDetail'] = repositoryDetail.data;
        // }

        yield HomeStateSuccess(events: events);
      } catch (error) {
        yield HomeStateError(error);
      }
    }
  }
}

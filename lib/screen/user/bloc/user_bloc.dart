import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './bloc.dart';

import 'package:fluhub/utils/graphql_client.dart';
import '../helper.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserStateEmpty();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUser) {
      yield UserStateLoading();
      try {
        final QueryResult result = await githubClient.query(
          QueryOptions(document: queryUser),
        );
        yield UserStateSuccess(user: result.data['viewer']);
      } catch (error) {
        yield UserStateError(error);
      }
    }
  }
}

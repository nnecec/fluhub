import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../config/constant.dart';
import './storage.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://api.github.com/graphql',
);

final AuthLink authLink = AuthLink(
  // getToken: () => 'Bearer ${Constant.TOKEN}',
  // OR
  getToken: () async {
    final access_token = await LocalStorage.getItem(Constant.TOKEN);
    return 'Bearer $access_token';
  },
);

final Link link = authLink.concat(httpLink as Link);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);

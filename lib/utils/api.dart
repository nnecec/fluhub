import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../config/constant.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://api.github.com/graphql',
);

final AuthLink authLink = AuthLink(
  getToken: () => 'Bearer ${Constant.TOKEN}',
  // OR
  // getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);

final Link link = authLink.concat(httpLink as Link);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);

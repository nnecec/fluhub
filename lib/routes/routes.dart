import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/Home.dart';
import '../pages/Trending.dart';
import '../pages/Search.dart';
import '../pages/Me.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.define("/", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Home();
      },
    ));

    router.define("/trending", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Trending();
      },
    ));

    router.define("/search", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Search();
      },
    ));

    router.define("/me", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Me();
      },
    ));

  }
}

class Application {
  static Router router;
}

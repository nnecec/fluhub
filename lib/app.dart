import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './routes.dart';
import './utils/graphql_client.dart';
import './store/store.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: GraphQLProvider(
        client: client,
        child: CupertinoApp(
          title: 'FluHub',
          routes: routes,
          initialRoute: '/',
          // home: Home()
        ),
      ),
    );
  }
}

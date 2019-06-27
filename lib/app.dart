import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './routes.dart';
import './utils/graphql_client.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CupertinoApp(
        title: 'FluHub',
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}

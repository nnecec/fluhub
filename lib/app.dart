import 'package:fluhub/store/reducers.dart';
import 'package:fluhub/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './routes.dart';
import './utils/graphql_client.dart';
import './store/store.dart';
import './screen/repository/bloc/bloc.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<StoreState>(
        store: store,
        child: StoreBuilder<StoreState>(
          builder: (BuildContext context, store) {
            return GraphQLProvider(
              client: client,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<RepositoryBloc>(
                    builder: (BuildContext context) => RepositoryBloc(),
                  ),
                ],
                child: CupertinoApp(
                  title: 'FluHub',
                  routes: routes,
                  initialRoute: '/',
                  theme: store.state.themeData,
                  // home: Home()
                ),
              ),
            );
          },
        ));
  }
}

import 'package:flutter/cupertino.dart';

import './routes.dart';
import './pages/Root.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'FluHub',
      home: Root(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './routes.dart';

class Routers extends StatefulWidget {
  @override
  State createState() {
    return RouterState();
  }
}

class RouterState extends State<Routers> {
  RouterState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}

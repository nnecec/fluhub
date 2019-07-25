import 'package:flutter/cupertino.dart';

class Explore extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Explore'),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
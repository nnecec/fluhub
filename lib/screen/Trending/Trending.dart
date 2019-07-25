import 'package:flutter/cupertino.dart';

class Trending extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Trending'),
      ),
      child: Text('Trending'),
    );
  }
}
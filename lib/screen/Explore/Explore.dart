import 'package:flutter/cupertino.dart';

class Explore extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Explore'),
          ),
        ],
      ),
    );
  }
}

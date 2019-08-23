import 'package:flutter/cupertino.dart';

class ExploreScreen extends StatelessWidget {
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

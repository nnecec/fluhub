import 'package:flutter/cupertino.dart';

class WrapperCard extends StatelessWidget {
  final Widget child;

  WrapperCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        // boxShadow: [
          // BoxShadow(
            // color: CupertinoColors.lightBackgroundGray,
            // blurRadius: 8.0,
            // offset: Offset(0, 2.0),
          // ),
        // ],
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: child,
    );
  }
}

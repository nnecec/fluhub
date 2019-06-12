import 'package:flutter/cupertino.dart';

class NCard extends StatelessWidget {
  Widget child;

  NCard(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xF5F2F2F2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: child,
    );
  }
}

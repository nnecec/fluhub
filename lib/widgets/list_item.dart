import 'package:flutter/cupertino.dart';

class ListItem extends StatelessWidget {
  ListItem({
    this.name,
    this.subtitle,
    this.before,
    this.after,
  });

  final String name;
  final String subtitle;
  final Widget before;
  final Widget after;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      height: 50.0,
      child: Row(
        children: <Widget>[
          // Icon
          if (before != null)
            Container(
              width: 38.0,
              margin: EdgeInsets.only(top: 10),
              child: before,
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Text(name),
                  Expanded(
                    child: Column(),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: CupertinoColors.inactiveGray,
                      fontSize: 12.0,
                      letterSpacing: -0.41,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0),
                    child: after,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

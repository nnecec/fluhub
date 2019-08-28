import 'package:flutter/cupertino.dart';

class ListItem extends StatelessWidget {
  ListItem({this.name, this.subtitle, this.before, this.after, this.bordered});

  final String name;
  final String subtitle;
  final Widget before;
  final Widget after;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return Container(
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
              decoration: this.bordered == false
                  ? null
                  : BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                      ),
                    ),
              child: Row(
                children: <Widget>[
                  Text(name),
                  Expanded(
                    child: Column(),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: theme.primaryColor,
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

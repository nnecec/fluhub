import 'package:flutter/cupertino.dart';

class ListCard extends StatelessWidget {
  List<ListItem> data;
  ListCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) {
        return ListItem(
          name: item.name,
          subtitle: item.subtitle,
        );
      }).toList(),
    );
  }
}

class ListItem extends StatefulWidget {
  final String name;
  final String subtitle;
  final Widget before;
  final Widget after;
  final bool bordered;

  ListItem(
      {@required this.name,
      this.subtitle,
      this.before,
      this.after,
      this.bordered});

  @override
  State<StatefulWidget> createState() {
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
  bool touched = false;

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return Container(
      height: 50.0,
      color: touched ? CupertinoColors.lightBackgroundGray : null,
      child: Row(
        children: <Widget>[
          // Icon
          if (widget.before != null)
            Container(
              width: 38.0,
              margin: EdgeInsets.only(top: 10),
              child: widget.before,
            ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Text(widget.name),
                  Expanded(
                    child: Column(),
                  ),
                  if (widget.subtitle != null)
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 12.0,
                        letterSpacing: -0.41,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0),
                    child: widget.after,
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

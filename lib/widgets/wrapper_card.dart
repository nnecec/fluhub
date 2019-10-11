import 'package:flutter/cupertino.dart';

class WrapperCard extends StatelessWidget {
  Widget child;
  int padding;

  WrapperCard({@required this.child, this.padding = 4});

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryContrastingColor,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        // boxShadow: [
        // BoxShadow(
        // color: CupertinoColors.lightBackgroundGray,
        // blurRadius: 8.0,
        // padding: padding(0, 2.0),
        // ),
        // ],
      ),
      margin: EdgeInsets.all(16.0),
      padding: padding == 4
          ? EdgeInsets.all(16.0)
          : EdgeInsets.only(left: 16.0, right: 16.0),
      child: child,
    );
  }
}

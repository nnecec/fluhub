import 'package:flutter/cupertino.dart';

class WrapperCard extends StatelessWidget {
  final Widget child;

  WrapperCard({this.child});

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

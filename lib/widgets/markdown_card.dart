import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownCard extends StatelessWidget {
  String data;

  MarkdownCard({this.data});

  _getCommonStyle(CupertinoThemeData theme, Color codeBackground) {
    MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet();
    return markdownStyleSheet
        .copyWith(
          codeblockDecoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: codeBackground,
            border: new Border.all(color: theme.primaryColor, width: 0.3),
          ),
        )
        .copyWith(
          blockquoteDecoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: theme.primaryColor,
            border: new Border.all(color: theme.primaryColor, width: 0.3),
          ),
          blockquote: TextStyle(color: theme.primaryColor),
        );
  }

  _getLightStyle(CupertinoThemeData theme) {
    return _getCommonStyle(theme, Color.fromRGBO(40, 44, 52, 1.00));
    // .copyWith(
    //   p: GSYConstant.smallText,
    //   h1: GSYConstant.largeLargeText,
    //   h2: GSYConstant.largeTextBold,
    //   h3: GSYConstant.normalTextBold,
    //   h4: GSYConstant.middleText,
    //   h5: GSYConstant.smallText,
    //   h6: GSYConstant.smallText,
    //   strong: GSYConstant.middleTextBold,
    //   code: GSYConstant.smallSubText,
    // );
  }

  _getDarkStyle(CupertinoThemeData theme) {
    return _getCommonStyle(theme, Color.fromRGBO(40, 44, 52, 1.00));
    // .copyWith(
    //   p: GSYConstant.smallText,
    //   h1: GSYConstant.largeLargeText,
    //   h2: GSYConstant.largeTextBold,
    //   h3: GSYConstant.normalTextBold,
    //   h4: GSYConstant.middleText,
    //   h5: GSYConstant.smallText,
    //   h6: GSYConstant.smallText,
    //   strong: GSYConstant.middleTextBold,
    //   code: GSYConstant.smallSubText,
    // );
  }

  _getStyle(CupertinoThemeData theme) {
    // var styleSheet = _getStyleSheetWhite(context);
    if (theme.brightness == Brightness.light) {
      return _getLightStyle(theme);
    }
    return _getDarkStyle(theme);
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return Container(
      color: theme.primaryContrastingColor,
      child: MarkdownBody(
        // styleSheet: _getStyle(theme),
        data: data,
      ),
    );
  }
}

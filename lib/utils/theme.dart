import 'package:flutter/cupertino.dart';

final CupertinoThemeData light = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.black, // TEXT
  primaryContrastingColor: CupertinoColors.white, // text background
  scaffoldBackgroundColor:
      CupertinoColors.extraLightBackgroundGray, // background
);

final CupertinoThemeData dark = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: CupertinoColors.white,
  primaryContrastingColor: CupertinoColors.darkBackgroundGray,
  scaffoldBackgroundColor: CupertinoColors.black,
);

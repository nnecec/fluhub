import 'package:flutter/cupertino.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor != null) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      return int.parse(hexColor, radix: 16);
    }
    return 0xFFF5F5F5;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

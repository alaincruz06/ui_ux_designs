import 'package:flutter/material.dart';

class AuxFunctions {
  static Color hexToColor(String code) {
    code = code.toUpperCase().replaceAll("#", "");
    if (code.length == 6) {
      code = "FF$code"; // Add opacity if not provided
    }
    return Color(int.parse(code, radix: 16));
  }

  static String colorToHex(Color color) {
    String hex = color.value.toRadixString(16).substring(2).toUpperCase();
    while (hex.length < 6) {
      hex = '0$hex';
    }
    return '#$hex';
  }
}

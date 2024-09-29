import 'package:flutter/material.dart';

class AuxFunctions {
  static Color hexToColor(String code) {
    code = code.toUpperCase().replaceAll("#", "");
    if (code.length == 6) {
      code = "FF$code"; // Add opacity if not provided
    }
    return Color(int.parse(code, radix: 16));
  }
}

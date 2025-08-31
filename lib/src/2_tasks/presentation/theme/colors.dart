import 'package:flutter/material.dart';

class TaskColors {
  //Must be the same length as: @enum TaskType
  final List<Color> tasksColors = [
    const Color(0xffB5CFF8),
    const Color(0xffACC18A),
    const Color(0xFFdf690b),
    const Color(0xFFFF4A1C),
    const Color(0xFFDA667B),
  ];

  static Color taskColorBg = const Color(0xff1b1b1b);
  static Color taskColorTexts = const Color(0xffffffff);
  static Color taskColorTextFieldBg = const Color(0xff313131);
  static Color taskColorButton = const Color(0xff3f6baa);
}

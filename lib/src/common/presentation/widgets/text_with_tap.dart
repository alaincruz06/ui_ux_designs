import 'package:flutter/material.dart';

class TextWithTap extends StatelessWidget {
  const TextWithTap({
    super.key,
    required this.text,
    this.textStyle,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

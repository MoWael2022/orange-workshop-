import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  DefaultText({Key? key, this.color, required this.text, this.fontSize, this.bold})
      : super(key: key);
  String text;
  Color? color;
  double? fontSize;
  FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: bold

      ),
    );
  }
}

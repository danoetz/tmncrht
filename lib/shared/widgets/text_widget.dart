import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:temancurhat/shared/styles/styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const TextWidget({
    Key key,
    @required this.text,
    this.color = MyColors.grey,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

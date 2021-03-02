import 'package:flutter/material.dart';

import 'text_widget.dart';

class CustomTextButton extends StatelessWidget {
  final Function onTap;
  final FontWeight fontWeight;
  final String text;
  final Color color;
  final double fontSize;

  const CustomTextButton(
      {Key key,
      this.onTap,
      this.fontWeight,
      this.text,
      this.color,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextWidget(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

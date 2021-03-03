import 'package:flutter/material.dart';

class SmileyWidget extends StatelessWidget {
  final Function onTap;
  final String assetPath;

  const SmileyWidget({
    Key key,
    this.onTap,
    this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        width: 38,
        height: 38,
        fit: BoxFit.contain,
      ),
    );
  }
}

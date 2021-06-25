import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    key,
    this.padding,
    this.margin,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
  }) : super(key: key);

  final EdgeInsetsGeometry padding, margin;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

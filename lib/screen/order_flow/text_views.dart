import 'package:flutter/material.dart';
import 'package:trackorder/utils/colors.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final double padding;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final String? fontFamily;
  final bool heading;

  TextView(
      {required this.text,
      this.textOverflow = TextOverflow.clip,
      this.textAlign = TextAlign.left,
      this.color,
      this.onTap,
      this.padding = 0.0,
      this.fontSize = 14.0,
      this.maxLines,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.fontFamily,
      this.heading = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          heading ? text.toUpperCase() : text,
          style: TextStyle(
              fontFamily: fontFamily != null ? fontFamily : 'Poppins',
              color: color ?? Colors.black,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle),
          textAlign: textAlign,
          overflow: textOverflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}

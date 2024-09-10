import 'package:flutter/material.dart';
import 'package:nanny_vanny/config/color_config.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  const TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: "AlegreyaSans",
        color: color ?? ColorConfig.darkBlue,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 18,
      ),
    );
  }
}

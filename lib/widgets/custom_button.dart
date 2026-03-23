import 'package:flutter/material.dart';
import '../core/utils/responsive.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.letterSpacing,
    this.height,
  });

  double _getFontSize(BuildContext context) {
    if (fontSize != null) return fontSize!;
    if (Responsive.isMobile(context)) return 14;
    if (Responsive.isTablet(context)) return 16;
    return 18;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: _getFontSize(context),
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final Color? color;

  const HeadingText({
    super.key,
    required this.text,
    this.color,
  });

  double _size(BuildContext context) {
    if (Responsive.isMobile(context)) return 20;
    if (Responsive.isTablet(context)) return 24;
    return 28;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: _size(context),
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  final Color? color;

  const SubtitleText({
    super.key,
    required this.text,
    this.color,
  });

  double _size(BuildContext context) {
    if (Responsive.isMobile(context)) return 12;
    if (Responsive.isTablet(context)) return 14;
    return 16;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: _size(context),
        color: color ?? Colors.grey,
      ),
    );
  }
}
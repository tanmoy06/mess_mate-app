import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle _inter({
    required FontWeight fontWeight,
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle sans400({
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return _inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle sans500({
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return _inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle sans600({
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return _inter(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle sans700({
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return _inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle sans800({
    Color color = Colors.white,
    double? fontSize,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return _inter(
      fontWeight: FontWeight.w800,
      color: color,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }
}

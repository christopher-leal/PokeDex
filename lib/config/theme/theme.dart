import 'package:flutter/material.dart';

abstract class AppTheme {
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFdd2c00);
  static ThemeData get light {
    return ThemeData.light().copyWith(
      primaryColor: red,
      accentColor: Colors.black,
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      primaryColor: red,
      accentColor: Colors.black,
    );
  }
}

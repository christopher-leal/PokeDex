import 'package:flutter/material.dart';

abstract class AppTheme {
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFdd2c00);
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: white,
      ),
      scaffoldBackgroundColor: white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      splashColor: Colors.transparent,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: white,
      ),
      scaffoldBackgroundColor: white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      splashColor: Colors.transparent,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex_app/config/constants.dart';
import 'package:pokedex_app/config/theme/theme.dart';
import 'package:pokedex_app/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kMaterialAppTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: SplashScreen(),
    );
  }
}

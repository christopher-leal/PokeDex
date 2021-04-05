import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/config/constants.dart';
import 'package:pokedex_app/config/theme/theme.dart';
import 'package:pokedex_app/presentation/splash/splash_screen.dart';
import 'package:pokedex_app/presentation/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit()..init(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: kMaterialAppTitle,
            debugShowCheckedModeBanner: false,
            theme: state ? AppTheme.dark : AppTheme.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

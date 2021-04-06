import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/config/constants.dart';
import 'package:pokedex_app/config/theme/theme.dart';
import 'package:pokedex_app/core/utils/navigation_utils.dart';
import 'package:pokedex_app/presentation/home/home_screen.dart';
import 'package:pokedex_app/presentation/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.loggedIn) {
            navigationPushReplacement(context, HomeScreen.init());
          }
        },
        child: Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppTheme.red,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.white,
                  radius: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/pokeball.png'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  kMaterialAppTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

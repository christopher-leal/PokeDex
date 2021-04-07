import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/constants.dart';
import 'config/theme/theme.dart';
import 'data/repositories/pokemons_service.dart';
import 'domain/repositories/pokemons_repository.dart';
import 'domain/usecases/pokemon_list_use_case.dart';
import 'presentation/home/home_cubit.dart';
import 'presentation/splash/splash_cubit.dart';
import 'presentation/splash/splash_screen.dart';
import 'presentation/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PokemonsRepository>(create: (context) => PokemonsService()),
        RepositoryProvider<SplashCubit>(create: (context) => SplashCubit()),
        RepositoryProvider<HomeCubit>(create: (context) => HomeCubit(context.read())),
        RepositoryProvider<PokemonListUseCase>(create: (context) => PokemonListUseCase(context.read())),
      ],
      child: BlocProvider(
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
      ),
    );
  }
}

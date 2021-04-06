import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/config/constants.dart';
import 'package:pokedex_app/config/theme/theme.dart';
import 'package:pokedex_app/data/repositories/pokemons_service.dart';
import 'package:pokedex_app/domain/repositories/pokemons_repository.dart';
import 'package:pokedex_app/domain/usecases/pokemon_list_use_case.dart';
import 'package:pokedex_app/presentation/home/home_cubit.dart';
import 'package:pokedex_app/presentation/splash/splash_cubit.dart';
import 'package:pokedex_app/presentation/splash/splash_screen.dart';
import 'package:pokedex_app/presentation/theme_cubit.dart';

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/presentation/pokemons/pokemon_grid_screen.dart';
import 'package:pokedex_app/presentation/pokemons/pokemon_list_screen.dart';
import 'package:pokedex_app/presentation/pokemons/pokemons_cubit.dart';

import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  Widget _getBodyWidgets(BuildContext context) {
    return context.read<HomeCubit>().state ? PokemonGridScreen() : PokemonListScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonsCubit(context.read())..getPokemons()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pokedex'),
          actions: [
            BlocBuilder<HomeCubit, bool>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(state ? Icons.grid_view : Icons.list),
                  onPressed: () {
                    context.read<HomeCubit>().changeView();
                  },
                );
              },
            )
          ],
        ),
        body: BlocBuilder<HomeCubit, bool>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _getBodyWidgets(context),
            );
          },
        ),
      ),
    );
  }
}

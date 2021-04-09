import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/domain/entities/pokemon_list_item.dart';
import 'package:pokedex_app/domain/usecases/pokemon_list_use_case.dart';

class PokemonsCubit extends Cubit<List<PokemonListItem>> {
  PokemonsCubit(this._pokemonListUseCase) : super([]);

  final PokemonListUseCase _pokemonListUseCase;

  Future<void> getPokemons() async {
    final pokemons = await _pokemonListUseCase.getPokemons();
    emit([...state, ...pokemons]);
  }

  void getBackgroundColor(PokemonListItem pokemon) {
    if (pokemon.backgroundColor == null) {
      getColorFromUrl(pokemon.picture).then((color) {
        pokemon.backgroundColor = Color.fromRGBO(color[0] as int, color[1] as int, color[2] as int, 1.0);
        emit([...state]);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_app/domain/entities/pokemon_list_item.dart';
import 'package:pokedex_app/domain/usecases/pokemon_list_use_case.dart';

class HomeCubit extends Cubit<List<PokemonListItem>> {
  HomeCubit(this._pokemonListUseCase) : super([]);

  final PokemonListUseCase _pokemonListUseCase;

  Future<void> init() async {
    emit([...state]);
    final pokemons = await _pokemonListUseCase.getPokemons();
    emit([...state, ...pokemons]);
  }

  Future<void> getMainColor(int index, ImageProvider imageProvider) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    state[index].backgroundColor = paletteGenerator?.dominantColor?.color;
    emit([...state]);
  }
}

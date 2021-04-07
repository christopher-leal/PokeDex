import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../domain/entities/pokemon_list_item.dart';
import '../../domain/usecases/pokemon_list_use_case.dart';

class HomeCubit extends Cubit<List<PokemonListItem>> {
  HomeCubit(this._pokemonListUseCase) : super([]);

  final PokemonListUseCase _pokemonListUseCase;

  Future<void> init() async {
    emit([...state]);
    final pokemons = await _pokemonListUseCase.getPokemons();
    emit([...state, ...pokemons]);
  }

  void getBackgroundColor(int index, ImageProvider imageProvider) {
    PaletteGenerator.fromImageProvider(imageProvider).then((generator) {
      state[index].backgroundColor = generator.dominantColor.color ?? Colors.red;
      emit([...state]);
    });
  }
}

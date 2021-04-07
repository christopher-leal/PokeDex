import '../entities/pokemon_list_item.dart';
import '../repositories/pokemons_repository.dart';

class PokemonListUseCase {
  PokemonListUseCase(this._pokemonsRepository);

  final PokemonsRepository _pokemonsRepository;

  Future<List<PokemonListItem>> getPokemons() async {
    final pokemons = await _pokemonsRepository.getPokemons();
    return pokemons;
  }
}

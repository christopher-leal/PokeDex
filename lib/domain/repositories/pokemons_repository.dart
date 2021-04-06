import 'package:pokedex_app/domain/entities/pokemon_list_item.dart';

abstract class PokemonsRepository {
  Future<List<PokemonListItem>> getPokemons();
}

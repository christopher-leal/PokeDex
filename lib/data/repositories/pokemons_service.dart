import 'package:dio/dio.dart';
import '../../config/constants.dart';
import '../../domain/entities/pokemon_list_item.dart';
import '../../domain/entities/pokemon_paginated_response.dart';
import '../../domain/repositories/pokemons_repository.dart';

class PokemonsService extends PokemonsRepository {
  String _url = '$kBaseUrl/pokemon';
  @override
  Future<List<PokemonListItem>> getPokemons() async {
    final response = await Dio().get(_url);
    final paginatedResponse = PokemonPaginatedResponse.fromJson(response.data as Map<String, dynamic>);
    _url = paginatedResponse.next;

    return paginatedResponse.results.map((p) {
      final urlParts = p.url.split('/');
      final id = urlParts[urlParts.length - 2];
      final picture = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

      return PokemonListItem(id: id, name: p.name, picture: picture);
    }).toList();
  }
}

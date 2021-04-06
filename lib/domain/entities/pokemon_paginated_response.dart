// To parse this JSON data, do
//
//     final pokemonPaginatedResponse = pokemonPaginatedResponseFromJson(jsonString);

import 'dart:convert';

PokemonPaginatedResponse pokemonPaginatedResponseFromJson(String str) => PokemonPaginatedResponse.fromJson(json.decode(str));

String pokemonPaginatedResponseToJson(PokemonPaginatedResponse data) => json.encode(data.toJson());

class PokemonPaginatedResponse {
  PokemonPaginatedResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonPaginatedResponse.fromJson(Map<String, dynamic> json) => PokemonPaginatedResponse(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
      );
  final int count;
  final String next;
  final String previous;
  final List<Result> results;

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.url,
  });
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json['name'],
        url: json['url'],
      );

  final String name;
  final String url;

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

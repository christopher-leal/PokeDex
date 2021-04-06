import 'package:flutter/material.dart';

class PokemonListItem {
  PokemonListItem({this.name, this.picture, this.id, this.backgroundColor});
  final String name;
  final String picture;
  final String id;
  Color backgroundColor;
}

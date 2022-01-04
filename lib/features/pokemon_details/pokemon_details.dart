import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_data.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonData? pokemon;

  @override
  Widget build(BuildContext context) {
    return Text('name: ${pokemon?.name}');
  }
}

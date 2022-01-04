import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_header.dart';
import 'package:pokedex_web/utilties/extensions.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonData? pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataHeader(
          backgroundColor: pokemon?.typeColor,
          name: pokemon?.name?.toUpperCase(),
          id: pokemon?.idValue,
          imageURL: pokemon?.sprites?.frontDefault,
          types: pokemon?.types?.map((e) => e.type!).toUnmodifiable(),
        )
      ],
    );
  }
}

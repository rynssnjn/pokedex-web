import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_container.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/evolution_card_item.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;

class EvolutionContainer extends StatelessWidget {
  const EvolutionContainer({
    this.evolution,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  final PokemonEvolution? evolution;
  final Color? titleColor;

  String _getPokemonId(String? url) {
    final uri = Uri(path: url);
    final pokemonId = uri.pathSegments.filter((segment) => segment.isNotBlank).last.replaceAll('.png', '');

    if (pokemonId.length == 1) {
      return '#00$pokemonId';
    } else if (pokemonId.length == 2) {
      return '#0$pokemonId';
    } else {
      return '#$pokemonId';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      title: strings.evolution,
      titleColor: titleColor,
      children: [
        if (evolution?.base != null)
          EvolutionCardItem(
            name: evolution?.base?.name?.capitalize(),
            imageUrl: evolution?.base?.url,
            id: _getPokemonId(evolution?.base?.url),
            decorationColor: titleColor,
          ),
        if (evolution?.middle != null)
          EvolutionCardItem(
            name: evolution?.middle?.name?.capitalize(),
            imageUrl: evolution?.middle?.url,
            id: _getPokemonId(evolution?.middle?.url),
            decorationColor: titleColor,
            isEven: true,
          ),
        if (evolution?.last?.isNotEmpty == true)
          ...evolution?.last
                  ?.mapIndexed(
                    (index, p) => EvolutionCardItem(
                      name: p.name?.capitalize(),
                      imageUrl: p.url,
                      id: _getPokemonId(p.url),
                      decorationColor: titleColor,
                      isEven: index % 2 == 0 && index != 0,
                    ),
                  )
                  .toUnmodifiable() ??
              [],
      ],
    );
  }
}

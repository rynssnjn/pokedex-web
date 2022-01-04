import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_statistics.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_container.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/stats_card_item.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    this.stats,
    this.decorationColor,
    Key? key,
  }) : super(key: key);

  final List<PokemonStatistics>? stats;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      title: strings.stats,
      titleColor: decorationColor,
      children: stats
          ?.map(
            (e) => StatsCardItem(
              category: e.stats?.name ?? '',
              value: e.baseState,
              barColor: decorationColor,
            ),
          )
          .toUnmodifiable(),
    );
  }
}

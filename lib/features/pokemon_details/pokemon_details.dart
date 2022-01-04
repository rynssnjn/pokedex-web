import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_ability.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/about_container.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/bottom_bar_indicator.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_header.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/evolution_container.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/moves_container.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/stats_container.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/utilties/extensions.dart';
import 'package:pokedex_web/widgets/custom_circular_indicator.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({
    this.pokemon,
    this.evolution,
    Key? key,
  }) : super(key: key);

  final PokemonData? pokemon;
  final Async<PokemonEvolution>? evolution;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  late PageController controller;
  late int currentIndex;

  @override
  void initState() {
    controller = PageController()..addListener(() => setState(() {}));
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _getFormattedAbilities(List<PokemonAbility> abilities) {
    final s = abilities.map((e) => e.name!.capitalize()).toUnmodifiable();
    return s.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataHeader(
          backgroundColor: widget.pokemon?.typeColor,
          name: widget.pokemon?.name?.toUpperCase(),
          id: widget.pokemon?.idValue,
          imageURL: widget.pokemon?.sprites?.frontDefault,
          types: widget.pokemon?.types?.map((e) => e.type!).toUnmodifiable(),
        ),
        Expanded(
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (index) => setState(() => currentIndex = index),
                children: [
                  AboutContainer(
                    height: widget.pokemon?.height,
                    weight: widget.pokemon?.weight,
                    baseExperience: widget.pokemon?.baseExperience,
                    abilities:
                        _getFormattedAbilities(widget.pokemon!.abilities!.map((e) => e.ability!).toUnmodifiable()),
                    decorationColor: widget.pokemon?.typeColor,
                  ),
                  StatsContainer(
                    stats: widget.pokemon?.stats,
                    decorationColor: widget.pokemon?.typeColor,
                  ),
                  widget.evolution?.when(
                        (e) => EvolutionContainer(
                          evolution: e,
                          titleColor: widget.pokemon?.typeColor,
                        ),
                        loading: () => Center(
                          child: CustomCircularIndicator(
                            valueColor: widget.pokemon?.typeColor ?? Colors.blueAccent,
                            strokeWidth: 5,
                          ),
                        ),
                        error: (key) => Text(key!),
                      ) ??
                      Container(),
                  MovesContainer(
                    moves: widget.pokemon?.moves?.map((e) => e.move?.name ?? '').toUnmodifiable(),
                    titleColor: widget.pokemon?.typeColor,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBarIndicator(
                  controller: controller,
                  pageIndicator: widget.pokemon?.typeColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

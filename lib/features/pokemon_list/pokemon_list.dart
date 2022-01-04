import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_web/features/pokemon_list/widgets/pokemon_list_item.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/utilties/constants.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    required this.onSelectPokemon,
    required this.loadNextPage,
    required this.pokemons,
    this.selectedPokemonId,
    this.isExpanded = false,
    this.appBarColor,
    Key? key,
  }) : super(key: key);

  final Future<void> Function(int id) onSelectPokemon;
  final Future<void> Function() loadNextPage;
  final Async<List<PokemonPokemon>> pokemons;
  final int? selectedPokemonId;
  final bool isExpanded;
  final Color? appBarColor;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Scaffold(
        appBar: widget.isExpanded
            ? null
            : AppBar(
                title: Text('Pokedex'),
                backgroundColor: widget.appBarColor,
              ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            final currentScroll = scrollInfo.metrics.pixels;
            final maxScroll = scrollInfo.metrics.maxScrollExtent;
            if (currentScroll >= maxScroll) {
              widget.loadNextPage();
            }
            return false;
          },
          child: widget.pokemons.when(
            (p) => ListView(
              controller: controller,
              children: p
                      ?.mapIndexed(
                        (index, pokemon) => PokemonListItem(
                          onSelectPokemon: () => widget.onSelectPokemon(index + 1),
                          imageUrl: pokemonImageUrl.replaceAll('%s', '${index + 1}'),
                          name: pokemon.name,
                          tileColor: widget.selectedPokemonId == index + 1 ? widget.appBarColor : null,
                          indicatorColor: widget.appBarColor,
                        ),
                      )
                      .toList() ??
                  [Container()],
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (key) => Text(key ?? 'sss'),
          ),
        ),
      ),
    );
  }
}

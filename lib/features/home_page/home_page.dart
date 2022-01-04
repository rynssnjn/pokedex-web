import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_web/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/utilties/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.loadNextPage,
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Future<void> Function() loadNextPage;
  final Async<List<PokemonPokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isExpanded = screenWidth >= breakpoint;
    return Scaffold(
      appBar: AppBar(title: Text('Pokedex')),
      drawer: isExpanded
          ? null
          : Drawer(
              child: PokemonListConnector(
                loadNextPage: loadNextPage,
                pokemons: pokemons,
                isExpanded: isExpanded,
              ),
            ),
      body: isExpanded
          ? Row(
              children: [
                PokemonListConnector(
                  loadNextPage: loadNextPage,
                  pokemons: pokemons,
                  isExpanded: isExpanded,
                ),
                Expanded(child: PokemonDetailsConnector()),
              ],
            )
          : PokemonDetailsConnector(),
    );
  }
}

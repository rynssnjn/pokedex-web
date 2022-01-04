import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_vm.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonListConnector extends StatelessWidget {
  const PokemonListConnector({
    required this.loadNextPage,
    required this.pokemons,
    this.isExpanded = false,
    Key? key,
  }) : super(key: key);

  final Future<void> Function() loadNextPage;
  final Async<List<PokemonPokemon>> pokemons;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVM>(
      vm: () => PokemonListFactory(),
      builder: (context, vm) => PokemonList(
        onSelectPokemon: vm.onSelectPokemon,
        loadNextPage: loadNextPage,
        pokemons: pokemons,
        selectedPokemonId: vm.selectedPokemonId,
        isExpanded: isExpanded,
      ),
    );
  }
}

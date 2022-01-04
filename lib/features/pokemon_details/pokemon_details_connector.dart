import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_details/pokemon_details.dart';
import 'package:pokedex_web/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVM>(
      vm: () => PokemonDetailsFactory(),
      builder: (context, vm) => PokemonDetails(
        pokemon: vm.pokemon,
      ),
    );
  }
}

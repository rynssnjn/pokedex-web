import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_vm.dart';
import 'package:pokedex_web/features/pokemon_list/widgets/pokemon_list_item.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';
import 'package:pokedex_web/utilties/constants.dart';

class PokemonListConnector extends StatelessWidget {
  static const route = 'pokemon-list';

  const PokemonListConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVM>(
      onInit: (store) => store.dispatch(GetPokemonsAction()),
      vm: () => PokemonListFactory(),
      builder: (context, vm) {
        return Scaffold(
          body: vm.pokemons.when(
            (pagination) => ListView(
              children: pagination!.results!
                  .mapIndexed(
                    (index, pokemon) => PokemonListItem(
                      imageUrl: pokemonImageUrl.replaceAll('%s', '${index + 1}'),
                      name: pokemon.name,
                      isSelected: index == 3,
                    ),
                  )
                  .toList(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (key) => Text(key ?? 'sss'),
          ),
        );
      },
    );
  }
}

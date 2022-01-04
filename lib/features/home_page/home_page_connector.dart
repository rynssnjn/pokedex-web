import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/features/home_page/home_page.dart';
import 'package:pokedex_web/features/home_page/home_page_vm.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';
import 'package:pokedex_web/utilties/extensions.dart';

class HomePageConnector extends StatelessWidget {
  static const route = 'home-page';

  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      onInit: (store) {
        if (store.state.pokemonState?.pokemons?.isEmpty == true) store.dispatch(GetPokemonsAction());
      },
      vm: () => HomePageFactory(),
      builder: (context, vm) => HomePage(
        loadNextPage: vm.loadNextPage,
        pokemons: vm.pokemons,
        appBarColor: vm.selectedPokemon?.typeColor,
      ),
    );
  }
}

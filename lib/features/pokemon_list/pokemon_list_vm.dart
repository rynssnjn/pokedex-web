import 'package:async_redux/async_redux.dart';
// import 'package:pokedex_web/apis/pokeapi/models/pagination_pokemon.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';
// import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonListFactory extends VmFactory<AppState, PokemonListConnector> {
  @override
  Vm? fromStore() {
    // TODO: implement fromStore
    throw UnimplementedError();
  }

  // Async<PaginationPokemon> _getPokemons() {

  // }

}

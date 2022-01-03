import 'package:async_redux/async_redux.dart';
import 'package:pokedex_web/apis/pokeapi/models/pagination_pokemon.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonListFactory extends VmFactory<AppState, PokemonListConnector> {
  @override
  Vm? fromStore() => PokemonListVM(pokemons: _getPokemons());

  Async<PaginationPokemon> _getPokemons() {
    if (state.wait?.isWaitingFor(GetPokemonsAction.key) == true) {
      return Async.loading();
    } else if (state.pagination?.results?.isNotEmpty == true) {
      return Async(state.pagination);
    } else {
      return Async.error('TEST');
    }
  }
}

class PokemonListVM extends Vm {
  PokemonListVM({required this.pokemons}) : super(equals: [pokemons]);

  final Async<PaginationPokemon> pokemons;
}

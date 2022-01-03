import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_web/features/home_page/home_page_connector.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';

class HomePageFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm? fromStore() => HomePageVM(
        loadNextPage: _loadNextPage,
        pokemons: _getPokemons(),
      );

  Async<List<PokemonPokemon>> _getPokemons() {
    if (state.wait?.isWaitingFor(GetPokemonsAction.key) == true && state.pokemonState?.pokemons?.isEmpty == true) {
      return Async.loading();
    } else if (state.pokemonState?.pokemons?.isNotEmpty == true) {
      return Async(state.pokemonState?.pokemons);
    } else {
      return Async.error('TEST');
    }
  }

  Future<void> _loadNextPage() async {
    final uri = Uri(path: state.pagination?.next);
    final parameters = uri.pathSegments.last.replaceAll('?', '').split('&');
    final offset = parameters.first.split('=').last.toInt();
    await dispatch(GetPokemonsAction(offset: offset));
  }
}

class HomePageVM extends Vm {
  HomePageVM({
    required this.loadNextPage,
    required this.pokemons,
  }) : super(equals: [pokemons]);

  final Future<void> Function() loadNextPage;
  final Async<List<PokemonPokemon>> pokemons;
}

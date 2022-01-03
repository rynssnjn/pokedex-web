import 'package:dartx/dartx.dart';
import 'package:pokedex_web/apis/api_service.dart';
import 'package:pokedex_web/state/actions/actions.dart';
import 'package:pokedex_web/state/app_state.dart';
import 'package:pokedex_web/utilties/app_starter.dart';

/// Gets all pokemon on paginated style.
class GetPokemonsAction extends LoadingAction<AppState> {
  GetPokemonsAction({this.offset = 0}) : super(actionKey: key);

  static const key = 'get-pokemons';

  final int offset;

  @override
  bool abortDispatch() => state.wait?.isWaitingFor(key) == true;

  @override
  Future<AppState> reduce() async {
    final pagination = await getIt<ApiService>().pokemonApi.getAll(offset: offset);
    final pokemons = [
      ...?state.pokemonState?.pokemons,
      ...?pagination?.results,
    ];
    final pokemonState = state.pokemonState?.copyWith(pokemons: pokemons.toUnmodifiable());

    return state.copyWith(
      pagination: pagination,
      pokemonState: pokemonState,
    );
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonListFactory extends VmFactory<AppState, PokemonListConnector> {
  @override
  Vm? fromStore() => PokemonListVM(onSelectPokemon: _onSelectPokemon);

  Future<void> _onSelectPokemon(int id) async => await dispatch(GetPokemonDataAction(id));
}

class PokemonListVM extends Vm {
  PokemonListVM({required this.onSelectPokemon});

  final Future<void> Function(int id) onSelectPokemon;
}

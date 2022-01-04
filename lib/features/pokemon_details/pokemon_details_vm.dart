import 'package:async_redux/async_redux.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_web/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_web/models/async.dart';
import 'package:pokedex_web/state/actions/pokemon_actions.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonDetailsFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm? fromStore() => PokemonDetailsVM(
        pokemon: state.pokemonState?.selectedPokemon,
        evolution: _getEvolution(),
      );

  Async<PokemonEvolution> _getEvolution() {
    if (state.wait?.isWaitingFor(GetEvolutionChain.key) == true) {
      return Async.loading();
    } else if (state.pokemonState?.selectedEvolution != null) {
      return Async(state.pokemonState?.selectedEvolution);
    } else {
      return Async.error('TEST');
    }
  }
}

class PokemonDetailsVM extends Vm {
  PokemonDetailsVM({
    this.pokemon,
    this.evolution,
  }) : super(equals: [pokemon, evolution]);

  final PokemonData? pokemon;
  final Async<PokemonEvolution>? evolution;
}

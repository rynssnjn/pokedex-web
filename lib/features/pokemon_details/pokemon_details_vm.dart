import 'package:async_redux/async_redux.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_web/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_web/state/app_state.dart';

class PokemonDetailsFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm? fromStore() => PokemonDetailsVM(
        pokemon: state.pokemonState?.selectedPokemon,
        evolution: state.pokemonState?.selectedEvolution,
      );
}

class PokemonDetailsVM extends Vm {
  PokemonDetailsVM({
    this.pokemon,
    this.evolution,
  }) : super(equals: [pokemon, evolution]);

  final PokemonData? pokemon;
  final PokemonEvolution? evolution;
}

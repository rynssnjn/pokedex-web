import 'package:dartx/dartx.dart';
import 'package:pokedex_web/apis/api_service.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_web/state/actions/actions.dart';
import 'package:pokedex_web/state/app_state.dart';
import 'package:pokedex_web/utilties/app_starter.dart';
import 'package:pokedex_web/utilties/constants.dart';
import 'package:pokedex_web/utilties/extensions.dart';

/// Gets all pokemon on paginated style.
class GetPokemonsAction extends LoadingAction<AppState> {
  GetPokemonsAction({this.offset = 0}) : super(actionKey: key);

  static const key = 'get-pokemons';

  final int offset;

  @override
  bool abortDispatch() => state.wait?.isWaitingFor(key) == true;

  @override
  Future<AppState?> reduce() async {
    final pagination = await getIt<ApiService>().pokemonApi.getAll(offset: offset);
    final pokemons = [
      ...?state.pokemonState?.pokemons,
      ...?pagination.results,
    ];
    final pokemonState = state.pokemonState?.copyWith(pokemons: pokemons.toUnmodifiable());

    return state.copyWith(
      pagination: pagination,
      pokemonState: pokemonState,
    );
  }
}

/// Gets data of the selected pokemon
class GetPokemonDataAction extends LoadingAction<AppState> {
  static const key = 'get-pokemon-data';

  GetPokemonDataAction(this.id) : super(actionKey: key);

  final int id;

  @override
  Future<AppState?> reduce() async {
    final pokemon = await getIt<ApiService>().pokemonApi.getById(id);

    return state.copyWith.pokemonState!(selectedPokemon: pokemon);
  }
}

/// Gets evolution chain of the selected pokemon
class GetEvolutionChain extends LoadingAction<AppState> {
  GetEvolutionChain(this.id) : super(actionKey: key);

  final int id;

  static const key = 'evolution-chain-action';
  @override
  Future<AppState?> reduce() async {
    final species = await getIt<ApiService>().pokemonApi.getSpeciesById(id);
    final uri = Uri(path: species.evolutionChain?.url);
    final evolutionId = uri.pathSegments.filter((segment) => segment.isNotBlank).last.toInt();
    final evolutionChain = await getIt<ApiService>().pokemonApi.getEvolutionChainById(evolutionId);
    final evolution = _mapEvolution(evolutionChain!);

    return state.copyWith.pokemonState!(selectedEvolution: evolution);
  }

  PokemonEvolution _mapEvolution(Map<dynamic, dynamic> chain) {
    final lastPokemonList = <PokemonPokemon>[];
    if (chain['evolves_to'].isNotEmpty == true) {
      final dynamic lastSpecies = chain['evolves_to'][0]['evolves_to'];
      for (final Map item in lastSpecies) {
        lastPokemonList.add(
          PokemonPokemon(
            name: item.specieName,
            url: pokemonImageUrl.replaceAll('%s', item.specieUrl.specieNumber),
          ),
        );
      }
    }

    return PokemonEvolution(
      base: PokemonPokemon(
        name: chain.specieName,
        url: pokemonImageUrl.replaceAll('%s', chain.specieUrl.specieNumber),
      ),
      middle: chain['evolves_to']?.isNotEmpty == true
          ? PokemonPokemon(
              name: chain.middleSpecie.specieName,
              url: pokemonImageUrl.replaceAll('%s', chain.middleSpecie.specieUrl.specieNumber),
            )
          : null,
      last: lastPokemonList,
    );
  }
}

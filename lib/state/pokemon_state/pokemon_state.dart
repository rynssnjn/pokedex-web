import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_pokemon.dart';

part 'pokemon_state.freezed.dart';
part 'pokemon_state.g.dart';

@freezed
class PokemonState with _$PokemonState {
  factory PokemonState({
    @JsonKey(name: 'pokemons', nullable: true) List<PokemonPokemon>? pokemons,
  }) = _PokemonState;

  factory PokemonState.init() => PokemonState(
        pokemons: List.empty(),
      );

  factory PokemonState.fromJson(Map<String, dynamic> json) => _$PokemonStateFromJson(json);
}

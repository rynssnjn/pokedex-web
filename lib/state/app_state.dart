import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_web/apis/pokeapi/models/pagination_pokemon.dart';
import 'package:pokedex_web/persistor/state_persistor.dart';
import 'package:pokedex_web/state/pokemon_state/pokemon_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @required @JsonKey(name: 'pokemonState') PokemonState? pokemonState,
    @JsonKey(name: 'wait', ignore: true) Wait? wait,
    @JsonKey(name: 'pagination', ignore: true) PaginationPokemon? pagination,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  factory AppState.init() => AppState(
        pokemonState: PokemonState.init(),
        wait: Wait(),
      );
}

class AppStateSerializer extends StateSerializer<AppState> {
  @override
  AppState decode(Map<String, dynamic>? data) => AppState.fromJson(data ?? <String, dynamic>{});

  @override
  Map<String, dynamic> encode(AppState state) => state.toJson();
}

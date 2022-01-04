import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_move.dart';

part 'pokemon_moves.freezed.dart';
part 'pokemon_moves.g.dart';

@freezed
class PokemonMoves with _$PokemonMoves {
  factory PokemonMoves({
    @JsonKey(nullable: true, name: 'move') PokemonMove? move,
  }) = _PokemonMoves;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) => _$PokemonMovesFromJson(json);
}

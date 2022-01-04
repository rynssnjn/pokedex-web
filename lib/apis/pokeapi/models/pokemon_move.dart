import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move.freezed.dart';
part 'pokemon_move.g.dart';

@freezed
class PokemonMove with _$PokemonMove {
  factory PokemonMove({
    @JsonKey(nullable: true, name: 'name') String? name,
  }) = _PokemonMove;

  factory PokemonMove.fromJson(Map<String, dynamic> json) => _$PokemonMoveFromJson(json);
}

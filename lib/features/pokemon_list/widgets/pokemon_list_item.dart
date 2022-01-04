import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/constants.dart';
import 'package:pokedex_web/widgets/custom_circular_indicator.dart';
import 'package:pokedex_web/widgets/loading_widget.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    required this.onSelectPokemon,
    this.imageUrl,
    this.name,
    this.tileColor,
    this.indicatorColor,
    Key? key,
  }) : super(key: key);

  final VoidCallback onSelectPokemon;
  final String? imageUrl;
  final String? name;
  final Color? tileColor;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      futureCallback: () async => onSelectPokemon(),
      renderChild: (isLoading, onTap) => ListTile(
        onTap: onTap,
        tileColor: tileColor ?? Colors.white,
        leading: CachedNetworkImage(
          imageUrl: imageUrl ?? pokemonImageUrl.replaceAll('%s', '1'),
          height: 50,
          width: 50,
          placeholder: (_, __) => Center(
            child: CustomCircularIndicator(
              valueColor: indicatorColor ?? Colors.blueAccent,
              size: 20,
            ),
          ),
        ),
        title: Text(name ?? ''),
        trailing: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: Center(child: CustomCircularIndicator(valueColor: indicatorColor ?? Colors.blueAccent)),
              )
            : null,
      ),
    );
  }
}

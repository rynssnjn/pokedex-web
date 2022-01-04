import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/constants.dart';
import 'package:pokedex_web/widgets/loading_widget.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    required this.onSelectPokemon,
    this.imageUrl,
    this.name,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final VoidCallback onSelectPokemon;
  final String? imageUrl;
  final String? name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      futureCallback: () async => onSelectPokemon(),
      renderChild: (isLoading, onTap) => SizedBox(
        child: ListTile(
          onTap: onTap,
          tileColor: isSelected ? Colors.amber : Colors.white,
          leading: CachedNetworkImage(
            imageUrl: imageUrl ?? pokemonImageUrl.replaceAll('%s', '1'),
            height: 50,
            width: 50,
            placeholder: (_, __) => Center(child: CircularProgressIndicator()),
          ),
          title: Text(name ?? ''),
          trailing: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(child: CircularProgressIndicator()),
                )
              : null,
        ),
      ),
    );
  }
}

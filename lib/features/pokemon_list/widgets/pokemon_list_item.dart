import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/constants.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    required this.onTap,
    this.imageUrl,
    this.name,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? imageUrl;
  final String? name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
      ),
    );
  }
}

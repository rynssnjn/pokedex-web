import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/constants.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;

class EvolutionCardItem extends StatelessWidget {
  const EvolutionCardItem({
    this.imageUrl,
    this.name,
    this.id,
    Key? key,
  }) : super(key: key);

  final String? imageUrl;
  final String? name;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: imageUrl ?? pokemonImageUrl.replaceAll('%s', '1'),
          height: 50,
          width: 50,
          placeholder: (_, __) => Center(child: CircularProgressIndicator()),
        ),
        title: Text(
          name ?? '',
          style: textTheme.bodyText1,
        ),
        subtitle: Text(
          strings.name,
          style: textTheme.caption,
        ),
         trailing: Text(
          id ?? '',
          style: textTheme.subtitle2,
        ),
      ),
    );
  }
}

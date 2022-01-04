import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/apis/pokeapi/models/pokemon_type.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/type_card.dart';

class DataHeader extends StatelessWidget {
  const DataHeader({
    this.backgroundColor,
    this.name,
    this.id,
    this.imageURL,
    this.types,
    Key? key,
  }) : super(key: key);

  final Color? backgroundColor;
  final String? name;
  final String? id;
  final String? imageURL;
  final List<PokemonType>? types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: backgroundColor),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueGrey, width: 3.0),
                ),
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: imageURL ?? '',
                  fit: BoxFit.fill,
                  placeholder: (_, __) => Center(child: CircularProgressIndicator()),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name ?? '',
                    style: textTheme.headline1?.copyWith(color: Colors.white),
                  ),
                  Text(
                    id ?? '',
                    style: textTheme.bodyText1?.copyWith(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: types?.map((type) => TypeCard(name: type.name)).toUnmodifiable() ?? [Container()],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

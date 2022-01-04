import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/constants.dart';

class CircularCachedImage extends StatelessWidget {
  const CircularCachedImage({
    this.imageURL,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  final String? imageURL;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor ?? Colors.blueGrey, width: 3.0),
      ),
      width: 120,
      height: 120,
      child: CachedNetworkImage(
        imageUrl: imageURL ?? pokemonImageUrl.replaceAll('%s', '1'),
        fit: BoxFit.fill,
        placeholder: (_, __) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

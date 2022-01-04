import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;
import 'package:pokedex_web/widgets/circular_cached_image.dart';

class EvolutionCardItem extends StatelessWidget {
  const EvolutionCardItem({
    this.imageUrl,
    this.name,
    this.id,
    this.decorationColor,
    this.isEven = false,
    Key? key,
  }) : super(key: key);

  final String? imageUrl;
  final String? name;
  final String? id;
  final Color? decorationColor;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: isEven ? null : decorationColor,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircularCachedImage(
              imageURL: imageUrl,
              borderColor: isEven ? decorationColor : null,
            ),
            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: ListTile(
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
                  style: textTheme.bodyText1?.copyWith(color: isEven ? null : decorationColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

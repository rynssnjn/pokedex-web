import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_container.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;

class MovesContainer extends StatelessWidget {
  const MovesContainer({
    this.moves,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  final List<String>? moves;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DataContainer(
      title: strings.moves,
      titleColor: titleColor,
      children: [
        GridView.count(
          childAspectRatio: 2,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: moves
                  ?.map(
                    (move) => Card(
                      elevation: 10,
                      child: Center(
                        child: Text(
                          move.capitalize(),
                          style: textTheme.subtitle2,
                        ),
                      ),
                    ),
                  )
                  .toUnmodifiable() ??
              [],
        ),
      ],
    );
  }
}

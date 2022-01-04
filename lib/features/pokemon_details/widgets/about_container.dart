import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/card_item_title.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/data_container.dart';
import 'package:pokedex_web/utilties/enums.dart';
import 'package:pokedex_web/utilties/extensions.dart';
import 'package:pokedex_web/utilties/strings.dart' as strings;

class AboutContainer extends StatelessWidget {
  const AboutContainer({
    this.height,
    this.weight,
    this.baseExperience,
    this.abilities,
    this.decorationColor,
    Key? key,
  }) : super(key: key);

  final int? height;
  final int? weight;
  final int? baseExperience;
  final String? abilities;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      title: strings.about,
      titleColor: decorationColor,
      children: [
        CardItemTile(
          category: strings.height,
          value: height?.getWithUnit(unit: MeasurementUnit.METERS),
          leadingColor: decorationColor,
          icon: Icons.height_rounded,
        ),
        CardItemTile(
          category: strings.weight,
          value: weight?.getWithUnit(unit: MeasurementUnit.KILOGRAMS),
          leadingColor: decorationColor,
          icon: Icons.linear_scale_rounded,
        ),
        CardItemTile(
          category: strings.baseExperience,
          value: '$baseExperience xp',
          leadingColor: decorationColor,
          icon: Icons.bar_chart_rounded,
        ),
        CardItemTile(
          category: strings.abilities,
          value: abilities,
          leadingColor: decorationColor,
          icon: Icons.accessibility_outlined,
        ),
      ],
    );
  }
}

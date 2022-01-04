import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_details/widgets/base_stats_bar.dart';

class StatsCardItem extends StatelessWidget {
  const StatsCardItem({
    this.category,
    this.value,
    this.barColor,
    Key? key,
  }) : super(key: key);

  final String? category;
  final int? value;
  final Color? barColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 10,
      child: ListTile(
        leading: Image(
          image: AssetImage('assets/images/$category.png'),
          width: 40,
          height: 40,
          color: barColor,
        ),
        title: BaseStatBar(
          rawScore: value,
          barWidth: 200,
          valueColor: barColor,
        ),
        subtitle: Text(
          category?.toUpperCase() ?? '',
          style: textTheme.caption,
        ),
        trailing: Text(
          value.toString(),
          style: textTheme.subtitle2,
        ),
      ),
    );
  }
}

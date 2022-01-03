import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PokemonListConnector.route:
        return MaterialPageRoute<dynamic>(builder: (_) => PokemonListConnector());
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}

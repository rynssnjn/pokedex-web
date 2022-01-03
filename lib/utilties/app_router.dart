import 'package:flutter/material.dart';
import 'package:pokedex_web/features/home_page/home_page_connector.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePageConnector.route:
        return MaterialPageRoute<dynamic>(builder: (_) => HomePageConnector());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}

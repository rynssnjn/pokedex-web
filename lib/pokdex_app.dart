import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_web/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_web/state/app_state.dart';
import 'package:pokedex_web/utilties/app_router.dart';
import 'package:pokedex_web/utilties/theme.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({
    required this.store,
    Key? key,
  }) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Pokedex Web App',
        theme: pokedexTheme,
        initialRoute: PokemonListConnector.route,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}

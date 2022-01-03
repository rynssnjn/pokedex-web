import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/app_router.dart';
import 'package:pokedex_web/utilties/theme.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp(
      title: 'Pokedex Web App',
      theme: pokedexTheme,
      initialRoute: 'asd',
      onGenerateRoute: router.generateRoute,
    );
  }
}

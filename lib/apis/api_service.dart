import 'package:pokedex_web/apis/api_client.dart';
import 'package:pokedex_web/apis/pokeapi/pokeapiclient.dart';
import 'package:pokedex_web/utilties/app_config.dart';

class ApiService {
  PokemonPokemonApi get pokemonApi => _pokemonApi ??= PokemonPokemonApi(_pokeApi);

  ApiClient get _pokeApi => _createApiClient(baseUrl: AppConfig().pokeApiBaseURL);

  ApiClient _createApiClient({String? baseUrl}) => ApiClient(baseUrl: baseUrl!);

  PokemonPokemonApi? _pokemonApi;
}

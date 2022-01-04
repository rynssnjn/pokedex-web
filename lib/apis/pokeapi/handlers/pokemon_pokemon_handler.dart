part of pokeapiclient;

class PokemonPokemonApi {
  final ApiClient apiClient;

  PokemonPokemonApi(ApiClient apiClient) : apiClient = apiClient;

  Future<PaginationPokemon> getAll({int offset = 0, int limit = 20}) async {
    final queryParams = <String, dynamic>{};

    queryParams['offset'] = offset.toString();

    queryParams['limit'] = limit.toString();

    final baseUri = Uri.tryParse(apiClient.baseUrl) ?? Uri();
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/');

    return apiClient.dio
        .getUri<dynamic>(uri)
        .then((response) => PaginationPokemon.fromJson(response.data as Map<String, dynamic>));
  }

  Future<PokemonData> getById(int id) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.tryParse(apiClient.baseUrl) ?? Uri();
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/$id/');

    return apiClient.dio
        .getUri<dynamic>(uri)
        .then((response) => PokemonData.fromJson(response.data as Map<String, dynamic>));
  }

  Future<PokemonSpecies> getSpeciesById(int id) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.tryParse(apiClient.baseUrl) ?? Uri();
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon-species/$id/');

    return apiClient.dio
        .getUri<dynamic>(
      uri,
    )
        .then((response) {
      return PokemonSpecies.fromJson(response.data as Map<String, dynamic>);
    });
  }

  Future<Map?> getEvolutionChainById(int id) async {
    final queryParams = <String, dynamic>{};
    final baseUri = Uri.tryParse(apiClient.baseUrl) ?? Uri();
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/evolution-chain/$id/');

    return http.get(uri).then((response) => jsonDecode(response.body)['chain'] as Map?);

    // return await http.get(apiClient.baseUrl + '/evolution-chain/$id/').then((response) {
    //   return jsonDecode(response.body)['chain'];
    // });
  }
}

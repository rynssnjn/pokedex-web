part of pokeapiclient;

class PokemonPokemonApi {
  final ApiClient apiClient;

  PokemonPokemonApi(ApiClient apiClient) : apiClient = apiClient;

  Future<PaginationPokemon?> getAll({int offset = 0, int limit = 20}) async {
    final queryParams = <String, dynamic>{};

    queryParams['offset'] = offset.toString();

    queryParams['limit'] = limit.toString();

    final baseUri = Uri.tryParse(apiClient.baseUrl) ?? Uri();
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/');

    return apiClient.dio
        .getUri<dynamic>(uri)
        .then((response) => PaginationPokemon.fromJson(response.data as Map<String, dynamic>));
  }
}

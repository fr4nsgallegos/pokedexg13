import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemonappg13/models/pokemon_reponse.dart';

class PokemonApi {
  String urlBase =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<PokemonResponse?> getPokemonResponse() async {
    Uri url = Uri.parse(urlBase);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      PokemonResponse pokemonResponse = PokemonResponse.fromJson(data);
      return pokemonResponse;
    }
    return null;
  }
}

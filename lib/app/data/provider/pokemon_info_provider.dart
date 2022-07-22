import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_info_model.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';
import 'package:http/http.dart' as http;
class ApiPokemonInformation extends GetConnect {  
  Future<PokemonInformation>getInformationOfPokemon(String nameOrId) async {

    Uri urlOfApi = Uri.https(urlBaseOfPokeAPI, '/api/v2/pokemon-species/'+nameOrId);

    final response = await http.get(urlOfApi);
    final infoPokemon = PokemonInformation.fromJson(jsonDecode(response.body));
    return infoPokemon;  
  }

}
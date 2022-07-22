import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/app/ui/utils/style_of_text.dart';
class ApiPokemon extends GetConnect {

  Future<Pokemon> getRandomPokemonById(int id) async{
    
    Uri urlOfApi = Uri.https(urlBaseOfPokeAPI, '/api/v2/pokemon/'+id.toString());
    
    final response = await http.get(urlOfApi);
    final pokemon = Pokemon.fromJson(jsonDecode(response.body));
    return pokemon;
  }

  Future getPokemonByNameOrId(String nameOrId) async {
    try {
      Uri urlOfApi = Uri.https(urlBaseOfPokeAPI, '/api/v2/pokemon/'+nameOrId);
      
      final response = await http.get(urlOfApi);
      final pokemon = Pokemon.fromJson(jsonDecode(response.body));
      return pokemon;
      
    } catch (e) {
      return e;
    }
  }
  
}
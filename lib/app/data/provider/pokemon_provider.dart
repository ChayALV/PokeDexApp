import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';

const baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

class ApiPokemon extends GetConnect {

  Future<Pokemon> getPokemon() async{
    final response = await get(baseUrl+'129');
    final pokemon = Pokemon.fromJson(response.body);
    return pokemon;
  }
  Future<Pokemon> getRandomPokemonById(int id) async{
    String url = baseUrl+id.toString();
    final response = await get(url);
    final pokemon = Pokemon.fromJson(response.body);
    return pokemon;
  }
  Future<Pokemon> getPokemonByNameOrId(String nameOrId) async {
    String url = baseUrl+nameOrId;
    final response = await get(url);
    final pokemon = Pokemon.fromJson(response.body);
    return pokemon;
  }
  
}
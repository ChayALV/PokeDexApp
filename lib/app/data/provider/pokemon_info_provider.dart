import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_info_model.dart';

const baseUrl = 'https://pokeapi.co/api/v2/pokemon-species/';

class ApiPokemonInformation extends GetConnect {  

  Future<PokemonInformation>getInformationOfPokemon(String nameOrId) async {
    String url = baseUrl+nameOrId;
    final response = await get(url);
    final infoPokemon = PokemonInformation.fromJson(response.body);
    return infoPokemon;  
  }

}
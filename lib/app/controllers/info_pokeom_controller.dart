import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_info_model.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/provider/pokemon_info_provider.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';

class InfoPokemonController extends GetxController with StateMixin {
  
  InfoPokemonController(){
    print(Get.arguments.toString());
    getPokemonByIdOrName(Get.arguments.toString());
  }

  final apiInfoPokeon = Get.find<ApiPokemonInformation>();
  final apiPokeon = Get.find<ApiPokemon>();

  PokemonInformation? infoPokemon;
  Pokemon? pokemon;
  
  getPokemonByIdOrName(String nameOrId) async {
    try {
      pokemon = await apiPokeon.getPokemonByNameOrId(nameOrId);
      infoPokemon = await apiInfoPokeon.getInformationOfPokemon(nameOrId);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
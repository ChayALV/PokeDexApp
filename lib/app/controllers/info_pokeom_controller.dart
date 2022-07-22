// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_info_model.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/provider/pokemon_info_provider.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';
class InfoPokemonController extends GetxController with StateMixin {
  
  InfoPokemonController(){
    getPokemonByIdOrName(Get.arguments.toString());
  }

  final apiInfoPokeon = Get.find<ApiPokemonInformation>();
  final apiPokeon = Get.find<ApiPokemon>();

  PokemonInformation? infoPokemon;
  Pokemon? pokemon;
  List<double> stats = [];
  List<String> labelsStats = [];
  String descriptionOfPokemon = '';
  String descriptionOfPokemonInEsp = '';
  
  getPokemonByIdOrName(String nameOrId) async {
    try {
      pokemon = await apiPokeon.getPokemonByNameOrId(nameOrId);
      infoPokemon = await apiInfoPokeon.getInformationOfPokemon(nameOrId);
      setInformationForRadarChar();
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
  setInformationForRadarChar(){
    pokemon!.stats.forEach((element) { 
      labelsStats.add(element.stat.name);
      stats.add(element.baseStat.toDouble());
    });
    infoPokemon!.flavorTextEntries.forEach((element) {
      if (element.language.name == 'en') descriptionOfPokemon = element.flavorText;
      if (element.language.name == 'es') descriptionOfPokemonInEsp = element.flavorText;
    });
  }
}

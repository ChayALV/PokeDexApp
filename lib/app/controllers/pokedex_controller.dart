import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class PokedexController extends GetxController {
  PokedexController(){
    setListPokemons(Get.arguments);
  }
  List<Pokemon> pokemons = [];
  setListPokemons(List<Pokemon> pokemons){
    this.pokemons = pokemons;
  }
  navigateToInfoPokemons(int indexOfListPokemons){
    Get.toNamed(Routes.INFOPOKEMON, arguments: pokemons[indexOfListPokemons].id);
  }
}
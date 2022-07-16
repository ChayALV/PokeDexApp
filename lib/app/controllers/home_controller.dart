import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class HomeController extends GetxController with StateMixin{
  HomeController(){
    getPokemon();
    getRandomPokemon();
  }

  final apiPokeon = Get.find<ApiPokemon>();

  Pokemon? pokemon;
  Pokemon? randomPokemon;
  
  getPokemon() async {
    pokemon = await apiPokeon.getPokemon();
  }

  getRandomPokemon() async {
    try {
      Random random = Random();
      int randomId = random.nextInt(898);
      randomPokemon = await apiPokeon.getRandomPokemonById(randomId);
      change(null, status: RxStatus.success());
    } catch (e) {
      getRandomPokemon();
    }
  }

  getPokemonByNameOrId(String name) async {
    try {
      Pokemon pokemon = await apiPokeon.getPokemonByNameOrId(name);
      Get.toNamed(Routes.INFOPOKEMON,arguments: pokemon.id);
    } catch (e) {
      Get.defaultDialog(
        title: 'ERROR',
        titleStyle: titlePokemon,
        content: Column(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(pokemon!.sprites.frontDefault, fit: BoxFit.cover)
            ),
            const Text( '''This pokemon not exist,
but have a magikarp''', textAlign: TextAlign.center,style:subTitle)
          ],
        ),
      );
    }
  }
    
  navigateToPokedex(){
    Get.toNamed(Routes.POKEDEX);
  }
  navigateToInfoPokemon(){
    Get.toNamed(Routes.INFOPOKEMON, arguments: randomPokemon!.id);
  }
}
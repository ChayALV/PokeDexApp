import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class HomeController extends GetxController with StateMixin{
  HomeController(){
    getRandomPokemon();
    get100Pokemons();
    getTheme();
  }

  final apiPokeon = Get.find<ApiPokemon>();
  final themeController = Get.find<ThemeController>();

  Pokemon? randomPokemon;
  List<Pokemon> pokemons = [];

  getTheme(){
    themeController.colorsOfTheme();
  }

  getRandomPokemon() async {
    try {
      Random random = Random();
      int randomId = random.nextInt(898);
      randomPokemon = await apiPokeon.getRandomPokemonById(randomId);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  getPokemonByNameOrId(String name) async {
    try {
      String formatName = name.toLowerCase().replaceAll(' ', '');
      Pokemon pokemon = await apiPokeon.getPokemonByNameOrId(formatName);
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
              child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/129.png')
            ),
            const Text( '''This pokemon not exist,
but have a magikarp''', textAlign: TextAlign.center,style:subTitle)
          ],
        ),
      );
    }
  }

  get100Pokemons() async {
    try {
      for (var idPokemon = 1; idPokemon < 100; idPokemon++) {
        Pokemon pokemon = await apiPokeon.getRandomPokemonById(idPokemon);
        pokemons.add(pokemon);
      }
    } catch (e) {
      return 0;
    }
  }

  navigateToPokedex(){
    Get.toNamed(Routes.POKEDEX, arguments: pokemons);
  }
  navigateToInfoPokemon(){
    Get.toNamed(Routes.INFOPOKEMON, arguments: randomPokemon!.id);
  }
}
import 'package:flutter/material.dart';
import 'package:pokedex/app/bindings/info_pokemon_bindign.dart';
import 'package:pokedex/app/bindings/pokedex_binding.dart';
import 'package:pokedex/app/ui/pages/home_page/home_page.dart';
import 'package:pokedex/app/ui/pages/info_pokemon_page/info_pokemon_page.dart';
import 'package:pokedex/app/ui/pages/pokedex_page/pokedex_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.POKEDEX, 
      page:()=> PokedexPage(),
      transition: Transition.circularReveal,
      curve: Curves.bounceInOut,
      binding: PokedexBinding()
    ),
    GetPage(
      name: Routes.INFOPOKEMON, 
      page:()=> InfoPokemonPage(),
      transition: Transition.circularReveal,
      curve: Curves.elasticIn,
      binding: InfoPokemonBinding()
    )
  ];
}
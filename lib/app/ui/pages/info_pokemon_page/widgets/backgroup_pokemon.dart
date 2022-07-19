
import 'package:flutter/material.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';

class BackgroundPokemon extends StatelessWidget {
  const BackgroundPokemon({
    Key? key,
    required this.themeController, 
    required this.controller,
  }) : super(key: key);

  final ThemeController themeController;
  final InfoPokemonController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color:  themeController.isDarkMode.value 
                ? Colors.white 
                : Colors.black
                ,width: 5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            typeColorOfPokemon[controller.pokemon!.types[0].type.name],
            themeController.isDarkMode.value 
              ? Colors.white 
              : Colors.black,
          ],
        ),
        shape: BoxShape.circle
      ),
      child: Image.network(controller.pokemon!.sprites.frontDefault, fit: BoxFit.cover,),
    );
  }
}
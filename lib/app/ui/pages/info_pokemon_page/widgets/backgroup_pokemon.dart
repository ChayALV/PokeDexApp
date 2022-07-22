
import 'package:flutter/material.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';

class IconPokemon extends StatelessWidget {
  const IconPokemon({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InfoPokemonController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).scaffoldBackgroundColor
                ,width: 5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            typeColorOfPokemon[controller.pokemon!.types[0].type.name],
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
        shape: BoxShape.circle
      ),
      child: Image.network(controller.pokemon!.sprites.frontDefault, fit: BoxFit.cover,),
    );
  }
}
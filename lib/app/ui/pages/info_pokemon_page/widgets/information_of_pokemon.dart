
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/utils/media_query.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class InformationOfPokemon extends StatelessWidget {
  const InformationOfPokemon({
    Key? key,
    required this.themeController, 
    required this.controller,
  }) : super(key: key);

  final ThemeController themeController;
  final InfoPokemonController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: displayWidth(context),
            height: displayHeight(context)*0.6,
            decoration: BoxDecoration(
              color:  themeController.isDarkMode.value 
                ? Colors.white.withOpacity(0.85) 
                : Colors.black.withOpacity(0.85),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    children: [
                      RadarChart(
                        labelColor: typeColorOfPokemon[controller.pokemon!.types[0].type.name],
                        strokeColor:  themeController.isDarkMode.value 
                          ? Colors.black
                          : Colors.white, 
                        values: controller.stats,
                        labels: controller.labelsStats,
                        maxValue: 250,
                        fillColor: typeColorOfPokemon[controller.pokemon!.types[0].type.name],
                        chartRadiusFactor: 0.7,
                      ),
                     Padding(
                       padding: const EdgeInsets.all(30),
                       child: Column(
                        children: [
                          const Text('About', style: title,),
                          Text(controller.descriptionOfPokemon, style: subTitle, textAlign: TextAlign.center,),
                          const Text('Descripción', style: title,),
                          Text(controller.descriptionOfPokemonInEsp, style: subTitle, textAlign: TextAlign.center,),
                        ],
                       ),
                     )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                      color: typeColorOfPokemon[controller.pokemon!.types[0].type.name],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 10,
                          offset: const Offset(0,0)
                        ),
                      ]
                    ),
                    child: Text(controller.pokemon!.name ,style: pokemonNae,textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

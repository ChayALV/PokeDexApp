import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/home_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/ui/utils/utilits.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class PokeDom extends StatelessWidget {

  final ThemeController themeController;
  final HomeController controller;
  final Pokemon pokemon;
  final VoidCallback callback;

  const PokeDom({
    Key? key, 
    required this.controller,
    required this.themeController,
    required this.pokemon, 
    required this.callback, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: displayWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: typeColorOfPokemon[pokemon.types[0].type.name],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                typeColorOfPokemon[pokemon.types[0].type.name],
                Theme.of(context).scaffoldBackgroundColor
              ],
            ),
          boxShadow: [
            BoxShadow(
              color: typeColorOfPokemon[pokemon.types[0].type.name],
              blurRadius: 10,
              offset: const Offset(0,0)
            ),
            BoxShadow(
              color: typeColorOfPokemon[pokemon.types[0].type.name].withOpacity(0.2),
              offset:const Offset(-4,-4)
            )
          ]
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 180,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 10,
                          offset: const Offset(0,0)
                        ),
                        
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap:callback,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 70,),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        margin: const EdgeInsets.only(left: 30, right: 30),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white.withOpacity(0.6) : Colors.grey.shade900.withOpacity(0.6),
                                              blurRadius: 15,
                                              offset: const Offset(0,0)
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.elliptical(100, 50)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context)*0.45,
                                    height: displayHeight(context)*0.2,
                                    child: Image.network(controller.randomPokemon!.sprites.frontDefault, fit: BoxFit.cover)
                                  )
                                ],
                              )
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: ${pokemon.id.toString()}',style: subTitle,),
                                Text('HP: ${pokemon.stats[0].baseStat}',style: subTitle,),
                                Text('Attak: ${pokemon.stats[1].baseStat}',style: subTitle,),
                                Text('Defense: ${pokemon.stats[2].baseStat}',style: subTitle,),
                                Text('Type: ${pokemon.types[0].type.name}',style: subTitle,),
                                Text('EXP. base: ${pokemon.baseExperience.toString()}',style: subTitle,),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: displayWidth(context),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 10,
                          offset: const Offset(0,0)
                        ),
                      ]
                    ),
                    child: GestureDetector(
                      onTap:  () => controller.navigateToInfoPokemon(),
                      child: Text(pokemon.name ,style: pokemonNae,textAlign: TextAlign.center)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: Image.network(pokemon.sprites.other!.home.frontDefault,)
            ),
          ],
        ),
      ),
    );
  }
}

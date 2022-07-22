import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/controllers/pokedex_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/global_widgets/background_image.dart';
import 'package:pokedex/app/ui/utils/utilits.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class PokedexPage extends GetView<PokedexController> {
  PokedexPage({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundImage(),
            GetBuilder<PokedexController>(
              builder: (controller) => 
                Column(
                  children: [
                    const Text('POKEDEX',style:pokemonNae ,),
                    const Spacer(),
                    SizedBox(
                      width: displayWidth(context),
                      height: displayHeight(context)*0.85,
                      child: GridView.count(
                      key: const PageStorageKey<String>('pokedex'),
                      crossAxisCount: 3,
                      children: List.generate(controller.pokemons.length, (index) {
                        return FadeIn(
                          duration: const Duration(milliseconds: 3000),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: ()=>controller.navigateToInfoPokemons(index),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: typeColorOfPokemon[controller.pokemons[index].types[0].type.name]
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              typeColorOfPokemon[controller.pokemons[index].types[0].type.name],
                                              Theme.of(context).scaffoldBackgroundColor,
                                            ],
                                          ),
                                        ),
                                        child: Image.network(controller.pokemons[index].sprites.frontDefault,),
                                      ),
                                      Text(controller.pokemons[index].name,style: subTitle,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );

  }
}
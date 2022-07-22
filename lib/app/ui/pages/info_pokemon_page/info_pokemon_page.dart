import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/global_widgets/background_image.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/loading_animation.dart';
import 'package:pokedex/app/ui/pages/info_pokemon_page/widgets/backgroup_pokemon.dart';
import 'package:pokedex/app/ui/pages/info_pokemon_page/widgets/information_of_pokemon.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';
import 'package:pokedex/app/ui/utils/utilits.dart';


class InfoPokemonPage extends GetView<InfoPokemonController> {
  InfoPokemonPage({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<InfoPokemonController>(
          builder: ((controller) =>
          FadeIn(
            duration: const Duration(milliseconds: 3000),
            child: Stack(
              children: [
                controller.obx(
                  (data) => BackgroundImage(
                    backgroun: typeColorOfPokemon[controller.pokemon!.types[0].type.name].withOpacity(0.7),
                  ),
                  onLoading: Container()
                ),
      
                controller.obx(
          
                  (data) => Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 590,
                        left: 0,
                        right: 0,
                        child: Image.network(controller.pokemon!.sprites.other!.home.frontDefault)
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 200),
                          SizedBox(
                            width: displayWidth(context),
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                SectionInformationOfPokemon(controller: controller,),
                                IconPokemon(controller: controller,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  onLoading:  LoadingAnimation(themeController: themeController),
          
                  onError: (erro)=> Text(erro.toString())
          
                ),
              ],
            ),
          ))
        )
      )
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';
import 'package:pokedex/app/ui/global_widgets/background_image.dart';
import 'package:pokedex/app/ui/utils/media_query.dart';
import 'package:pokedex/app/ui/utils/pokemon_colors.dart';

class InfoPokemonPage extends GetView<InfoPokemonController> {
  const InfoPokemonPage({Key? key}) : super(key: key);
//TODO:REFACTORIZA EL CODIGO
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
                controller.obx((data) => BackgroundImage(
                    backgroundColor: typeColorOfPokemon[controller.pokemon!.types[0].type.name].withOpacity(0.7),
                  ),
                  onLoading: Container()
                ),
                
                controller.obx(
          
                  (data) => Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 550,
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
                                Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        width: displayWidth(context),
                                        height: displayHeight(context)*0.6,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 5),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        typeColorOfPokemon[controller.pokemon!.types[0].type.name],
                                        Colors.white,
                                      ],
                                    ),
                                    shape: BoxShape.circle
                                  ),
                                  child: Image.network(controller.pokemon!.sprites.frontDefault, fit: BoxFit.cover,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  onLoading:  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50,),
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black.withOpacity(0.5), 
                          size: 150
                        ),
                      ],
                    ),
                  ),
          
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
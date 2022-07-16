import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokedex/app/controllers/home_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/global_widgets/background_image.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/poke_dom.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/secction_tab.dart';
import 'package:pokedex/app/ui/utils/media_query.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
//TODO:REFACTORIZA EL CODIGO

  final themeController = Get.find<ThemeController>();
  late AnimationController controllerAnimationContainer;
  late AnimationController controllerAnimationPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20,),
          GetBuilder<ThemeController>(
            builder: ((controller) => FloatingActionButton(
                onPressed: () => controller.changeTheme(),
                child: const Icon(Icons.change_circle_outlined),
              )
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
            builder: ((controller) => Stack(
                children: [
                  Obx(
                    ()=> BackgroundImage(
                      backgroundColor: themeController.isDarkMode.value 
                        ? Colors.white.withOpacity(0.7) 
                        : Colors.black.withOpacity(0.7)
                      ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //? Title
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                const Text('Welcome',style: title,),
                                Row(
                                  children:const [
                                    Text('to POKEDEX ',style: title),
                                    Text('APP!',style: titlePokemon)
                                  ],
                                )
                              ],
                            ),

                            //?Search bar
                            Obx(
                              (() => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: displayWidth(context),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red,
                                    boxShadow: [
                                     const  BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 10,
                                        offset: Offset(0,0)
                                      ),
                                      BoxShadow(
                                        color: Colors.red.shade800,
                                        offset:const Offset(-4,-4)
                                      )
                                    ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onFieldSubmitted: (value) {
                                        controller.getPokemonByNameOrId(value.toString());
                                      },
                                      style: subTitle,
                                      decoration:InputDecoration(
                                        icon: Icon(Icons.search,size: 30,color: themeController.isDarkMode.value ? Colors.grey.shade900 : Colors.white),
                                        hintText: 'Search to POKEMON !!!',
                                        border: InputBorder.none,
                                        hintStyle: subTitle
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                            ),
                            
                            //?Taps menu
                            SecctionTab(
                              titleOfButtom: 'Pokedex',
                              function : () => controller.navigateToPokedex(), 
                              colorOfButtom: Colors.lightBlueAccent.shade400, 
                              colorOfShadowButtom: Colors.lightBlueAccent.shade700,
                            ),

                            //?PokeDom
                            controller.obx(
                              (data) => Obx(() => FadeIn(
                                  duration: const Duration(milliseconds: 3000),
                                  controller: (animationController) => controllerAnimationContainer = animationController,
                                  child: PokeDom(
                                    conatinerColor: themeController.isDarkMode.value ? Colors.white : Colors.grey.shade900,
                                    shadowPokemonColor: themeController.isDarkMode.value ? Colors.grey.shade900.withOpacity(0.6) : Colors.white.withOpacity(0.6), 
                                    pokemon: controller.randomPokemon!, 
                                    callbackOfPokemonSprite: (){
                                      controllerAnimationContainer
                                      ..reset()
                                      ..forward();
                                      controllerAnimationPokemon
                                      ..reset()
                                      ..forward();
                                      controller.getRandomPokemon(); 
                                    },
                                    callbackOfNamePokemon: () => controller.navigateToInfoPokemon(),
                                    imagen: BounceInDown(
                                      controller: (animationController) => controllerAnimationPokemon = animationController,
                                      child: SizedBox(
                                        width: displayWidth(context)*0.45,
                                        height: displayHeight(context)*0.2,
                                        child: Image.network(controller.randomPokemon!.sprites.frontDefault, fit: BoxFit.cover)
                                      ),
                                    ), 
                                  ),
                                )
                              ),

                              onLoading: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 50,),
                                    LoadingAnimationWidget.staggeredDotsWave(
                                      color:  themeController.isDarkMode.value ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5), 
                                      size: 150
                                    ),
                                  ],
                                ),
                              ),

                              onError: (error) => Text('valio pepino bro :v $error')

                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      )
    );
  }
}
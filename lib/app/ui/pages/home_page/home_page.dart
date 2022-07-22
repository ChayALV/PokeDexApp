// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/home_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/global_widgets/background_image.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/loading_animation.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/poke_dom.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/search_bar.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/secction_tab.dart';
import 'package:pokedex/app/ui/pages/home_page/widgets/title_app.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();
  late AnimationController controllerAnimationContainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetBuilder<HomeController>(
            builder: ((controller) => Stack(
                  children: [
                    const BackgroundImage(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //? Title
                              const TitleApp(),

                              //?Search bar
                              SearchBar(
                                themeController: themeController,
                                controller: controller,
                              ),

                              //?Taps menu
                              SecctionTab(
                                titleOfButtom: 'Pokedex',
                                function: () => controller.navigateToPokedex(),
                                colorOfButtom: Colors.lightBlueAccent.shade400,
                                colorOfShadowButtom:
                                    Colors.lightBlueAccent.shade700,
                              ),

                              //?PokeDom
                              controller.obx(
                                (data) => FadeIn(
                                      duration:
                                          const Duration(milliseconds: 3000),
                                      controller: (animationController) =>
                                          controllerAnimationContainer =
                                              animationController,
                                      child: PokeDom(
                                        controller: controller,
                                        themeController: themeController,
                                        pokemon: controller.randomPokemon!,
                                        callback: () {
                                          controllerAnimationContainer
                                            ..reset()
                                            ..forward();
                                          controller.getRandomPokemon();
                                        },
                                      ),
                                    ),
                                onLoading: LoadingAnimation(
                                    themeController: themeController),
                                onError: (error) => Text(error.toString(),style: const TextStyle(fontSize: 30),))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}

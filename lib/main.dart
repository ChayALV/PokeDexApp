import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/bindings/home_binding.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/data/provider/pokemon_info_provider.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:pokedex/app/ui/theme/themes.dart';
void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  Pokedex({Key? key}) : super(key: key);

  final apiPokemon = Get.put( ApiPokemon() );
  final apiInfoPokemon = Get.put( ApiPokemonInformation() );
  final themeCOntroller = Get.put( ThemeController() );
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        theme: Themes().themeLight,
        darkTheme: Themes().themeDark,
        initialBinding: HomeBinding(),
        getPages: AppPages.pages,
    );
  }
}
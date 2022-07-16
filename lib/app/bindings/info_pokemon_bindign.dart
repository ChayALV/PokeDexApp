import 'package:get/get.dart';
import 'package:pokedex/app/controllers/info_pokeom_controller.dart';

class InfoPokemonBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<InfoPokemonController>(() => InfoPokemonController());
  }
}
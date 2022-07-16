import 'package:get/get.dart';
import 'package:pokedex/app/controllers/pokedex_controller.dart';

class PokedexBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PokedexController>(() => PokedexController());
  }
}
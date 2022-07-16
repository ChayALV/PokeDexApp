import 'dart:developer';

import 'package:get/get.dart';
import 'package:pokedex/app/ui/theme/themes.dart';

class ThemeController extends GetxController {
  ThemeController(){
    log('CONTROLADOR DE THEMAS INICIADO');
  }
  final isDarkMode = true.obs;
  changeTheme(){
    Get.changeTheme(
      Get.isDarkMode 
        ? Themes().themeLight 
        : Themes().themeDark 
    );
    Get.isDarkMode 
      ? isDarkMode.value = true
      : isDarkMode.value = false
    ;
  }
}
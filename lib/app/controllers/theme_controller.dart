import 'package:get/get.dart';
import 'package:pokedex/app/ui/theme/themes.dart';
class ThemeController extends GetxController {
  final isDarkMode = true.obs;
 
  getAndChangeTheme(){
    Get.changeTheme(
      Get.isDarkMode 
        ?  Themes().themeDark 
        :  Themes().themeLight 
    );
    colorsOfTheme();
    print(Get.theme.cardColor);
    print(Get.theme.colorScheme.background);
    print(Get.theme.colorScheme.onPrimaryContainer);
    print(Get.theme.colorScheme.primary);
    print(Get.theme.colorScheme.onBackground);
    print(Get.theme.colorScheme.onPrimaryContainer);
    print(Get.theme.colorScheme.onPrimary);
    print(Get.theme.colorScheme.onPrimary);
  }
  colorsOfTheme(){
    Get.isDarkMode 
      ? isDarkMode.value = true
      : isDarkMode.value = false
    ;

  }
  bool containerColor(){
    return Get.isDarkMode ? true : false;
  }
}
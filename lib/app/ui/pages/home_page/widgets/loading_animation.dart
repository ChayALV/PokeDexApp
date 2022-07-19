
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
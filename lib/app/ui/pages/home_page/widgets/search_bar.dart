
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/home_controller.dart';
import 'package:pokedex/app/controllers/theme_controller.dart';
import 'package:pokedex/app/ui/utils/utilits.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onFieldSubmitted: (value) {
              controller.getPokemonByNameOrId(value.toString());
            },
            style: subTitle,
            decoration:InputDecoration(
              icon: Icon(Icons.search,size: 30,color: MediaQuery.of(context).platformBrightness != Brightness.dark ? Colors.grey.shade900 : Colors.white),
              hintText: 'Search to POKEMON !!!',
              border: InputBorder.none,
              hintStyle: subTitle
            ),
          ),
        )
      ),
    );
  }
}
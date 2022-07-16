import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/controllers/pokedex_controller.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('PokedexPage')),

    body: SafeArea(
      child: Text('PokedexController'))
    );
  }
}
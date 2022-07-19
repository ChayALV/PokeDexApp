import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/utils/media_query.dart';
import 'package:pokedex/app/ui/utils/style_of_text.dart';

class SecctionTab extends StatelessWidget {
  final String titleOfButtom;
  final VoidCallback function;
  final Color colorOfButtom;
  final Color colorOfShadowButtom;
  const SecctionTab({
    Key? key, 
    required this.function,
    required this.colorOfButtom,
    required this.colorOfShadowButtom, 
    required this.titleOfButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: displayHeight(context)*0.11,
          width: displayWidth(context),
          decoration: BoxDecoration(
            color: colorOfButtom,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorOfButtom,
                colorOfShadowButtom
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colorOfButtom,
                blurRadius: 10,
                offset: const Offset(0,0)
              ),
              BoxShadow(
                color: colorOfShadowButtom,
                offset:const Offset(-4,-4)
              )
            ]
          ),
          child:  Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(titleOfButtom,style: pokemonNae),
                const Spacer(),
                SizedBox(
                   child: Image.asset('assets/images/kindpng_159383.png',fit: BoxFit.cover,)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

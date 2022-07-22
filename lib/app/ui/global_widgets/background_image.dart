import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/utils/utilits.dart';

class BackgroundImage extends StatelessWidget {
  final Color? backgroun;
  const BackgroundImage({
    Key? key, this.backgroun, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: displayWidth(context),
          height: displayHeight(context),
          child: Image.asset('assets/images/19778.png',fit: BoxFit.cover,)
        ),
        Container(
          color: backgroun ?? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          width: displayWidth(context),
          height: displayHeight(context),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/utils/media_query.dart';

class BackgroundImage extends StatelessWidget {
  final Color backgroundColor;
  const BackgroundImage({
    Key? key, 
    required this.backgroundColor
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
          color: backgroundColor,
          width: displayWidth(context),
          height: displayHeight(context),
        )
      ],
    );
  }
}
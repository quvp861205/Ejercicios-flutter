import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Widgets/floating_action_button_green.dart';
class CardImageWithFabIcon extends StatelessWidget {

  final String pathImage; // "assets/img/beach.jpg";
  final double height;
  final double width;
  double left = 20.0;
  final VoidCallback onPressedFabIcon;
  final IconData iconData1, iconData2;

  CardImageWithFabIcon({Key key,
    @required this.pathImage,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.iconData1,
    @required this.iconData2,
    this.left
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only(
        left: this.left
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathImage.contains('http')? NetworkImage(pathImage):new FileImage(new File(pathImage))
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      )
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        card,
        FloatingActionButtonGreen(icon1: this.iconData1, icon2: this.iconData2, onPressed: onPressedFabIcon)
      ],
    );
  }

}
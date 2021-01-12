import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = 300.0;
    double height = 350.0;
    double left = 20.0;

    return Container(
      height: 330.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(pathImage: "assets/img/beach.jpg", iconData: Icons.favorite_border,
          width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/mountain.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/snow.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/woman.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left)
        ]
      )
    );
  }

}
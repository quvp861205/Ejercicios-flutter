import 'package:flutter/material.dart';
import 'package:platzi_trips_app/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 330.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/beach.jpg"),
          CardImage("assets/img/mountain.jpg"),
          CardImage("assets/img/snow.jpg"),
          CardImage("assets/img/woman.jpg")
        ]
      )
    );
  }

}
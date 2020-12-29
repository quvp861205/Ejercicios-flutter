import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review_list.dart';

class DescriptionPlace extends StatelessWidget {

  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  String descriptionDummy = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \n'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";
  @override
  //Esta funcion deberia devolver toda la interfaz de usuario
  Widget build(BuildContext context) {
    final star = Container (
        margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0,
        ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611)
      )
    );

    final star_half = Container (
        margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0,
        ),
        child: Icon(
            Icons.star_half,
            color: Color(0xFFf2C611)
        )
    );

    final star_border = Container (
        margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0,
        ),
        child: Icon(
            Icons.star_border,
            color: Color(0xFFf2C611)
        )
    );

    final description = Container(
      margin: new EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontSize: 16.0,
          fontFamily: "Comic",
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a)
      )
      )
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
             style: TextStyle(
               fontFamily: "Comic",
               fontSize: 30.0,
               fontWeight: FontWeight.w900
          ),
            textAlign: TextAlign.left

          )
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            star_half
          ],
        )
      ]
    );

    return SingleChildScrollView(
        child: Column(

        children: <Widget>[
        title_stars,
        description,
        new ReviewList()

      ],
    )
    );
  }

}
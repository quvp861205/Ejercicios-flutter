import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  String pathImage = "assets/img/avatar.png";
  String name = "Goergina LaFuerte";
  String details = "1 review 5 photos";
  String comment = "There is amazing river in srilanka";

  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {

    final userComment = Container(
        margin: EdgeInsets.only(
            left: 20.0
        ),
        width: 250.0,
        child: Text(
            comment,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 13.0,
                fontFamily: "Comic",
                fontWeight: FontWeight.w900,
                color: Color(0xFFa3a5a7)
            )
        )
    );

    final star = Container (
        margin: EdgeInsets.only(
          right: 3.0,
        ),
        child: Icon(
            Icons.star,
            color: Color(0xFFf2C611)
        )
    );

    final userInfo = Row(children: <Widget>[
      Container(
        margin: EdgeInsets.only(
            left: 20.0
        ),
        child: Text(
            details,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13.0,
              fontFamily: "Comic",
              color: Color(0xFFa3a5a7)
            )
        ),
    ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
          ]
    )]
    );


    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 7.0,
          fontFamily: "Comic",
        )
      )
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userName,
        userInfo,
        userComment
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        )
      )

    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ]
    );

  }

}
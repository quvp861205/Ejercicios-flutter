import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData iconData;

  TextInputLocation(
      {Key key,
      @required this.hintText,
      @required this.controller,
      @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        child: TextField(
            controller: controller,
            style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          decoration: InputDecoration(
            hintText: this.hintText,
            suffixIcon: Icon(this.iconData),
            fillColor: Color(0xFFFFFFFF),
            filled: true,
            border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              )
          ),
        ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( //SOMBRA
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(
              0.0, 0.7
            )
          )
        ]
      ),

    );
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/Widgets/gradient_back.dart';
import 'package:platzi_trips_app/Widgets/text_input.dart';
import 'package:platzi_trips_app/Widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;
  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  } 
}

class _AddPlaceScreen extends State<AddPlaceScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            children: [
              Container( // COLOR BACKGROUND
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  )
                )
              ),

              Flexible( // TITULO
                child: Container(
                    width: screenWidth,
                  child: Container(
                      padding: EdgeInsets.only(top:45.0, left: 20.0, right: 10.0),
                      child: TitleHeader(title: "Add a new Place")
                  )
              )
              )
              ]
          ),

              Container(
                margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
                child: ListView(
                  children: [
                    Container(  //AQUI VA LA FOTO

                    ),
                    Container( //AQUI VA EL TITULO
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: TextInput(
                        hintText: "Title",
                        inputType: null,
                        maxLines: 1,
                        controller: _controllerTitlePlace
                    )
                    ),

                    TextInput( //AQUI VA LA DESCRIPCION
                        hintText: "Description",
                        inputType: TextInputType.multiline,
                        maxLines: 4,
                        controller: _controllerTitlePlace
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextInputLocation(
                        hintText: "Add Location",
                        iconData: Icons.location_on
                      )
                    )
                  ],
                )
              )

            ]
          )
    );

  }

}
  
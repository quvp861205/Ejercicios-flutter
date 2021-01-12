import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/Widgets/button_purple.dart';
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

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
                      alignment: Alignment.center,
                      child: CardImageWithFabIcon(
                        pathImage: widget.image.path,
                        iconData: Icons.camera_alt,
                        width: 350.0,
                        height: 250.0,
                        left: 0
                      )
                    ),
                    Container( //AQUI VA EL TITULO
                      margin: EdgeInsets.only(top:20.0, bottom: 20.0),
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
                        controller: _controllerDescriptionPlace
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextInputLocation(
                        hintText: "Add Location",
                        iconData: Icons.location_on
                      )
                    ),

                    Container(
                      width: 70.0,
                      child: ButtonPurple(
                        buttonText: "Add Place",
                        onPressed: () {
                          String uid =  userBloc.currentUser.uid;
                          String path = "${uid}/${DateTime.now().toString()}.jpg";
                          final uploading = userBloc.uploadFile(path, widget.image);

                          //SUBIR FOTO DE LA CAMARA
                          uploading.then((urlImage) {

                            print("=====Devuelve url imagen===== ${urlImage}");

                            //GUARDAR DATOS EN BD
                            userBloc.updatePlaceDataMongo(Place(
                                name: _controllerTitlePlace.text,
                                description: _controllerDescriptionPlace.text,
                                likes: 0, uriImage: urlImage
                            )).
                            then((value) {

                              print("======Termino de guardar el nuevo lugar======");

                              Navigator.pop(context);

                            });
                          }).catchError((onError){
                            print("======Error al guardar el nuevo lugar======  ${onError}");
                          });
                        },
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
  
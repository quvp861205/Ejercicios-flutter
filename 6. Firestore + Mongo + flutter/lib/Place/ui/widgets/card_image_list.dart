import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of(context);
    double width = 300.0;
    double height = 350.0;
    double left = 20.0;

    return Container(
      height: 330.0,
      child: FutureBuilder(
              future: userBloc.getAllPlacesMongo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("Cargando lugares de home ${snapshot.data}");
                if( snapshot.data==null ){
                  return Container(
                      child: Center(
                          child: CircularProgressIndicator()
                      )
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(25.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    print("====entro");
                   var element = snapshot.data[index];

                   return CardImageWithFabIcon(pathImage: element.uriImage, iconData: Icons.favorite_border,
                     width: width, height: height, left: left);

                  },
                );

              }
          )
    );
          /*CardImageWithFabIcon(pathImage: "assets/img/beach.jpg", iconData: Icons.favorite_border,
          width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/mountain.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/snow.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/woman.jpg", iconData: Icons.favorite_border,
              width: width, height: height, left: left)*/

  }

}
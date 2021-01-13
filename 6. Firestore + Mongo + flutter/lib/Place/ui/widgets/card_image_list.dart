import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    double width = 300.0;
    double height = 350.0;
    double left = 20.0;

    return Container(
      height: 330.0,
      child: FutureBuilder(
              future: userBloc.getAllPlacesMongo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("============Mostrando lugares de home========== ${snapshot.data}");
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

                   var element = snapshot.data[index];
                   return CardImageWithFabIcon(pathImage: element.uriImage, iconData1: Icons.favorite, iconData2: Icons.favorite_border,
                     width: width, height: height, left: left, onPressedFabIcon: () {
                       if(!element.like)
                         element.likes++;
                       else
                         element.likes--;

                       element.like = !element.like;

                       likePlaces(element);
                   });

                  },
                );

              }
          )
    );
  }

  likePlaces(Place place)  {
    print("Hizo tap sobre el corazoncito ${place.toJson()}");
    userBloc.setLikesPlacesMongo(place.id, place.likes);
  }
}
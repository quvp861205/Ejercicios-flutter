import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review_list.dart';
import 'package:platzi_trips_app/description_place.dart';
import 'package:platzi_trips_app/profile/header_appbar_profile.dart';
import 'package:platzi_trips_app/profile/floating_action_button_profile.dart';


class ProfileTrips extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
            children: [//Agrupamos los elemento
              //ReviewList(),
            ],
          ),
          HeaderAppBarProfile(),
          FloatingActionButtonProfile()
        ]//un Stack permite colocar un elemento encima de otro

      );
    }

}

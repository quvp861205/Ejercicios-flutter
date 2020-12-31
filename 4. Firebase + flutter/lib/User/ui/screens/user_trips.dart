import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/screens/header_appbar_user.dart';
import 'package:platzi_trips_app/User/ui/widgets/floating_action_button_user.dart';


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

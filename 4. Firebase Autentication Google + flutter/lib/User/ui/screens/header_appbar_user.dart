import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/widgets/gradient_back_user.dart';//importamos las clases que vamos a utilizar para hacer Stack
import 'package:platzi_trips_app/User/ui/widgets/data_user.dart';
import 'package:platzi_trips_app/User/ui/widgets/card_image_list_user.dart';

class HeaderAppBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//Stack me permite acomodar un Widget sobre otro Widget
      children: [
        GradientBackProfile("Profile"),
        ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
          children: [//Agrupamos los elementos
            DataProfile("assets/img/ann.jpg", "Anahí Salgado", "team@platzi.com"),
          ],
        ),
        CardImageListProfile(),
      ],
    );
  }

}


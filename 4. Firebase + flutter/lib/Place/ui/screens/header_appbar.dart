import 'package:flutter/material.dart';
import 'file:///C:/Users/Pedro/AndroidStudioProjects/platzi_trips_app/lib/Widgets/gradient_back.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Bienvenido"),
        CardImageList()
      ]
    );
  }

}
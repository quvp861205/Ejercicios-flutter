import 'package:flutter/material.dart';
import 'file:///C:/Users/Pedro/AndroidStudioProjects/platzi_trips_app/lib/Widgets/floating_action_button_green.dart';
class CardImageWithFabIcon extends StatelessWidget {

  final String pathImage; // "assets/img/beach.jpg";
  final double height;
  final double width;
  double left = 20.0;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImageWithFabIcon({Key key,
    @required this.pathImage,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.left
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only(
        left: this.left
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      )
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        card,
        FloatingActionButtonGreen(icon: this.iconData, onPressed: onPressedFabIcon)
      ],
    );
  }

}
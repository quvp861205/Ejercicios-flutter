import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData icon1;
  final IconData icon2;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.icon1,
    @required this.icon2,
    @required this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !this._pressed;
      widget.onPressed();
    });
  }


    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon( this._pressed ? widget.icon1 : widget.icon2 ),
      heroTag: null,
    );
  }

}
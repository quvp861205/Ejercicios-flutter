import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Widgets/gradient_back.dart';
import 'package:platzi_trips_app/Widgets/button_green.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Welcome \n This is your Travel App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 37.0,
                fontFamily: "Comic",
                color: Colors.white,
                fontWeight: FontWeight.bold
              )),
              ButtonGreen(text:'Login with Gmail',
              onPressed: (){

              },
              width: 300.0,
              height: 50.0)
            ],
          )
        ],
      )
    );
  }
  
}
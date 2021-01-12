import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Widgets/gradient_back.dart';
import 'package:platzi_trips_app/Widgets/button_green.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/platzi_trips.dart';
import 'package:platzi_trips_app/User/model/user.dart' as ModelUser;

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;

  double screenWidth;

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;

    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  //monitorizar como esta la sesion de mi logueo
  // dejar entrar si ya esta logueado
  Widget _handleCurrentSession() {
    //userBloc.connect();

    return StreamBuilder(
      // ignore: deprecated_member_use
      stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.hasData) {
            print("\n----- Esta autenticado correctamente -----  [${snapshot.data.displayName} ${snapshot.data.email}]\n");
            return PlatziTrips(); //Esta conectado
          } else if (snapshot.hasError) {
            print("\n----- Ocurro un error durante el autenticado -----\n");
            return Text("Ocurrio un error en la transmision de datos");
          } else  if(!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI(); //no esta conectado
          } else {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 20,
                        width: 70,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.cyan[400],)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("C a r g a n d o", style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 22,
                          fontFamily: "Lato",
                          decoration: TextDecoration.none)
                      ),)
                  ]
              ),
            );
          }
        }
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Text("Welcome \n This is your Travel App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 37.0,
                          fontFamily: "Comic",
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ))
                )
              )
              ,
              ButtonGreen(text:'Login with Google',
              onPressed: (){
                userBloc.signIn().then(
                    (User user) {
                      print('\n----El usuario logueado es ${user.displayName} ${user.uid}----');

                      //Agregamos el usuario logueado a mongodb
                      userBloc.updateUserDataMongo(ModelUser.User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoURL
                      ));
                    }
                ).catchError((onError) {
                  print("======Error al guadar usuario: ${onError}");
                });
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
import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:firebase_auth/firebase_auth.dart'  as auth;

class CloudMongoAPI {

  //Colecciones de la base de datos
  final String USERS = 'users';
  final String PLACES = 'places';
  VoidCallback callback;

  var db = Db("mongodb://192.168.1.73:27017/flutter");
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //Registra un usuario
  Future<void> updateUserDataMongo(User user) async {
    print("----Insertar User: ${user.toJson()}------");
    await db.open();
    db.collection(USERS).insert(user.toJson());
    await  db.close();
    return callback;
  }

  Future<bool> updateDataPlaceMongo(Place place) async {
    bool error = false;
    try{

      var currentUser = _auth.currentUser;
      place.userOwner = currentUser.uid;

      print("----Insertar nuevo lugar: ${place.toJson()}------");
      await db.open();
      await db.collection(PLACES).insert(place.toJson());
      await  db.close();
    } catch(Exception) {
      error = true;
    }

    return error;
  }
}
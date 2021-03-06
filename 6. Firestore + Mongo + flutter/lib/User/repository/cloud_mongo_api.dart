import 'package:flutter/material.dart';
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
  List<Place> tmp;

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

  Future updateDataPlaceMongo(Place place) async {

      var currentUser = _auth.currentUser;
      place.userOwner = USERS+"/"+currentUser.uid;

      print("----Insertar nuevo lugar: ${place.toJson()}------");
      await db.open();
      var result = await db.collection(PLACES).insert(place.toJson()).then((value){

      });

      await  db.close();

      return result;

  }

  Future getPlacesUserMongo() async {

    var currentUser = _auth.currentUser;
    var userOwner = USERS+"/"+currentUser.uid;

    print("----Obtener lugares del usuario: ${userOwner}------");
    await db.open();
    var result = await db.collection(PLACES).find({"userOwner":userOwner}).toList();

    List<Place> list = new List<Place>();
    for(var i=0; i<result.length; i++) {

      list.add(Place(
          id: result[i]["_id"].toHexString(),
        description: result[i]["description"],
        likes: result[i]["likes"],
        name: result[i]["name"],
        uriImage: result[i]["uriImage"]
      ));
    }



    this.tmp = list;

    print("Lista de lugares: ${this.tmp}");

    await  db.close();

    return list;

  }

  Future getAllPlacesMongo() async {

    print("--------Obtener todos lugares de todos los usuarios--------");
    await db.open();
    var result = await db.collection(PLACES).find().toList();

    List<Place> list = new List<Place>();
    for(var i=0; i<result.length; i++) {
      list.add(Place(
          id: result[i]["_id"].toHexString(),
          description: result[i]["description"],
          likes: result[i]["likes"],
          name: result[i]["name"],
          uriImage: result[i]["uriImage"]
      ));
    }



    this.tmp = list;

    print("Primer elemento: ${this.tmp[0].toJson()}");

    await  db.close();

    return list;

  }

  Future<String> setLikesPlacesMongo(String id, int likes) async {
    String error;

    try{
      await db.open();
      var result = await db.collection(PLACES).update(where.eq('_id',ObjectId.fromHexString(id)), modify.set('likes', likes));
      await  db.close();
    } catch(exc){
      error = exc;
    }

    if( error!=null )
    print("setLikesPlacesMongo ${error}");

  }

}
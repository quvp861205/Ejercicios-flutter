import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'dart:io' show Platform;

//"mongodb+srv://cluster0.gwwsm.mongodb.net/<dbname>" --username pedro

class CloudFirestoreAPI {

  //Colecciones de la base de datos
  final String USERS = 'users';
  final String PLACE = 'places';

  //Permite realizar operacones con la db
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Registra un usuario
  Future<void> updateUserData(User user) {

   DocumentReference ref = _db.collection(USERS).doc(user.uid);
    print('----Grabando un user: ${user}-----');

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions( merge: true));
  }

}
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart' as Model;
import 'package:platzi_trips_app/User/repository/cloud_mongo_repository.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos (Stream)
  //Stream de Firebase
 // Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  // ignore: deprecated_member_use
  Stream<User> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  // ignore: deprecated_member_use
  Stream<User> get authStatus => streamFirebase;
  User get currentUser => FirebaseAuth.instance.currentUser;

  //1. Hacer SignIn a la aplicacion Google
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Hacer signout en google
  signOut() {
    _auth_repository.signOut();
  }

  //3. Registrar usuario en base de datos en  Firebase
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserDataFirebase(Model.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  //Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  //3. Registrar usuario en base de datos en  mongodb
  final _cloudMongoRepository = CloudMongoRepository();
  void updateUserDataMongo(Model.User user) async => _cloudMongoRepository.updateUserDataMongo(user);

  //4. Agregar un nuevo lugar
  Future updatePlaceDataMongo(Place place) => _cloudMongoRepository.updateDataPlaceMongo(place);

   //5. Subir imagen del nuevo lugar
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  //6. Obtener lugares  de un usuario en especifico
 getPlacesUserMongo() => _cloudMongoRepository.getPlacesUserMongo();
 getAllPlacesMongo() => _cloudMongoRepository.getAllPlacesMongo();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
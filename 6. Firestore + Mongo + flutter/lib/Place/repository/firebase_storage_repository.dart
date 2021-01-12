import 'dart:io';
import 'package:platzi_trips_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {

  var _firebaseStorageAPI = FirebaseStorageAPI();

  Future uploadFile(String path, File image) => _firebaseStorageAPI.uploadFile(path, image);
}
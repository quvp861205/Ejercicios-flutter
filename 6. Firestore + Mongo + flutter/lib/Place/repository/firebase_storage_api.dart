import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {

  var _storageReference = FirebaseStorage.instance.ref();

  Future uploadFile(String path, File image) async {

    String returnURL;
    UploadTask  uploadTask = _storageReference.child(path).putFile(image);

    var imageUrl = await (await uploadTask).ref.getDownloadURL();

    return imageUrl;

  }
}
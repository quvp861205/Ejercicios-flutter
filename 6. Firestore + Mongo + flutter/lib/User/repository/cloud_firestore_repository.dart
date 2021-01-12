import 'package:platzi_trips_app/User/model/user.dart' as model;
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {


  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(model.User user) {
    print("======user========${user.toJson()}");
    _cloudFirestoreAPI.updateUserData(user);
  }


}

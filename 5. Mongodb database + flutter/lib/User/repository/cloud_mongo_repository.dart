import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_mongo_api.dart';

class CloudMongoRepository {

  final _cloudMongoAPI = CloudMongoAPI();
  void updateUserDataMongo(User user) =>
      _cloudMongoAPI.updateUserDataMongo(user);

}

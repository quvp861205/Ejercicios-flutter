import 'package:platzi_trips_app/User/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

class CloudMongoAPI {

  //Colecciones de la base de datos
  final String USERS = 'users';
  final String PLACE = 'places';

  var db = Db("mongodb://192.168.1.73:27017/flutter");

  //Registra un usuario
  Future<void> updateUserDataMongo(User user) async {
    print("----Insertar User: ${user.toJson()}------");
    await db.open();
    await db.collection(USERS).insert(user.toJson());
    await  db.close();
  }
}
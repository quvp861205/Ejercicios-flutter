import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
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

  //1. Hacer SignIn a la aplicacion Google
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Hacer signout en google
  signOut() {
    _auth_repository.signOut();
  }

  //3. Registrar usuario en base de datos en  mongodb
  final _cloudMongoRepository = CloudMongoRepository();
  void updateUserDataMongo(Model.User user) async => _cloudMongoRepository.updateUserDataMongo(user);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}